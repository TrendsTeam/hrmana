using BioMetric.Helpers;
using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using zkemkeeper;

namespace BioMetric.UI.Attendance
{
    public partial class frmSynchronizeFingerPrint : Form
    {
        #region Variables

        public string ErrorMessage = "";
        private IDeviceService _IDeviceService = new DeviceService();
        private IEmployeeService _IEmployeeService = new EmployeeService();
        private IEmployeeDeviceMapService _IEmployeeDeviceMapService = new EmployeeDeviceMapService();
        private bool isFirstActivated = false, isclose = true;
        private CZKEMClass CtrlBioComm = new CZKEMClass();

        #endregion


        #region Form events and constructor

        public frmSynchronizeFingerPrint()
        {
            InitializeComponent();
        }

        private void frmSynchronizeFingerPrint_Activated(object sender, EventArgs e)
        {
            try
            {
                if (!isFirstActivated)
                {
                    isFirstActivated = true;
                    this.Refresh();
                    this.Cursor = Cursors.WaitCursor;

                    ErrorMessage = SynchronizeFingerPrints();

                    this.Cursor = Cursors.Default;
                    isclose = false;
                    this.Close();
                }
            }
            catch (Exception _Exception)
            {
                throw _Exception;
            }
        }

        private void frmSynchronizeFingerPrint_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (isclose)
            {
                DialogResult result = MessageBox.Show("Are you sure you want to cancel?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.No)
                {
                    e.Cancel = true;
                }
                else
                    e.Cancel = false;
            }
        }

        #endregion


        #region Private Methods

        private string SynchronizeFingerPrints()
        {
            string _ErrorMessage = string.Empty;

            try
            {
                #region CONNECT TERMINALS

                Device _Device;
                List<Device> _ListOfDevice = new List<Device>();

                Result<DataTable> _Result = _IDeviceService.GetAllDevice();

                if (_Result.IsSuccess)
                {
                    foreach (DataRow row in _Result.Data.Rows)
                    {
                        _Device = new Device();

                        _Device.DeviceID = new Guid(Convert.ToString(row["DeviceID"]));
                        _Device.DeviceName = Convert.ToString(row["DeviceName"]);
                        _Device.Address = Convert.ToString(row["Address"]);
                        _Device.DeviceCode = Convert.ToString(row["DeviceCode"]);
                        _Device.PhoneNo = Convert.ToString(row["PhoneNo"]);
                        _Device.Port = Convert.ToString(row["Port"]);
                        _Device.IPAddress = Convert.ToString(row["IPAddress"]);

                        _ListOfDevice.Add(_Device);
                    }
                }

                if (_ListOfDevice != null && _ListOfDevice.Count > 0)
                {
                    foreach (Device _DeviceItem in _ListOfDevice)
                    {
                        CommonFunction.Connect(_DeviceItem.IPAddress);
                    }

                    string _NetWorkDevice = IPInfo.GetARPResult();

                    if (_ListOfDevice.Where(q => _NetWorkDevice.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").Count() != 0)
                    {
                        List<Device> _ListOfSelectDevice = _ListOfDevice.Where(q => _NetWorkDevice.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").ToList();

                        foreach (Device _DeviceItem in _ListOfSelectDevice)
                        {
                            bool _Connected = false;

                            _Connected = CtrlBioComm.Connect_Net(_DeviceItem.IPAddress, Convert.ToInt32(_DeviceItem.Port));

                            if (_Connected)
                            {
                                if (CtrlBioComm.IsTFTMachine(1))
                                {
                                    _ErrorMessage = GetAndUpdateData(_DeviceItem, true, _ErrorMessage);
                                }
                                else
                                {
                                    _ErrorMessage = GetAndUpdateData(_DeviceItem, false, _ErrorMessage);
                                }

                                CtrlBioComm.Disconnect();
                            }
                            else
                            {
                                if (_ErrorMessage == "")
                                {
                                    _ErrorMessage = "Unable to connect " + _DeviceItem.DeviceName + " device";
                                }
                                else
                                {
                                    _ErrorMessage += "\nUnable to connect " + _DeviceItem.DeviceName + " device.";
                                }
                            }
                        }
                    }
                    else
                    {
                        _ErrorMessage = "Unable to connect device"; ;
                    }
                }

                #endregion

            }
            catch (Exception _Exception)
            {
                throw _Exception;
            }

            return _ErrorMessage;
        }

        private string GetAndUpdateData(Device p_Device, bool p_IsTFT, string p_ErrorMessage)
        {
            int _machinePrivilege = 0;
            string _enrollNo = "", _name = "", _password = "";
            bool _enabled = false;
            List<EmployeeDeviceMaps> _ListOfEmployeeDevice = new List<EmployeeDeviceMaps>();

            Result<List<EmployeeDeviceMaps>> _ResultEmployeeDevice = _IEmployeeDeviceMapService.GetAllEmployeeDeviceAttendanceByDeviceId(p_Device.DeviceID ?? Guid.NewGuid());

            if (_ResultEmployeeDevice.IsSuccess)
            {
                _ListOfEmployeeDevice = _ResultEmployeeDevice.Data;
            }

            CtrlBioComm.EnableDevice(1, false);

            if (_ListOfEmployeeDevice != null && _ListOfEmployeeDevice.Count > 0)
            {
                foreach (EmployeeDeviceMaps _EmployeeDeviceMap in _ListOfEmployeeDevice)
                {
                    Employee _Employee = new Employee();
                    _enrollNo = _EmployeeDeviceMap.EnrollmentNo;
                    _Employee.EmployeeID = _EmployeeDeviceMap.EmployeeId ?? Guid.NewGuid();

                    if (p_IsTFT)
                    {
                        if (CtrlBioComm.SSR_GetUserInfo(1, _enrollNo, out _name, out _password, out _machinePrivilege, out _enabled))
                        {
                            _Employee.EnrollNo = _enrollNo;

                            if (!string.IsNullOrEmpty(_password))
                            {
                                _Employee.Password = SecurityHelper.EncryptString(_password);
                            }

                            _Employee = GetEmployeeFingure(_Employee);
                            _Employee = GetEmployeeFace(_Employee);

                            Result<bool> _Result = _IEmployeeService.SaveEmployeeFingerPrint(_Employee);

                            if (!_Result.IsSuccess)
                            {
                                p_ErrorMessage = _Result.Message;
                            }
                        }
                    }
                    else
                    {
                        if (CtrlBioComm.GetUserInfo(1, Convert.ToInt32(_enrollNo), ref _name, ref _password, ref _machinePrivilege, ref _enabled))
                        {
                            _Employee.EnrollNo = _enrollNo;

                            if (!string.IsNullOrEmpty(_password))
                            {
                                _Employee.Password = SecurityHelper.EncryptString(_password);
                            }

                            _Employee = GetEmployeeFingure(_Employee);
                            _Employee = GetEmployeeFace(_Employee);

                            Result<bool> _Result = _IEmployeeService.SaveEmployeeFingerPrint(_Employee);

                            if (!_Result.IsSuccess)
                            {
                                p_ErrorMessage = _Result.Message;
                            }
                        }
                    }
                }
            }

            CtrlBioComm.EnableDevice(1, true);

            return p_ErrorMessage;
        }

        private Employee GetEmployeeFace(Employee p_Employee)
        {
            string FaceData = "";
            int iLength = 0;
            bool _IsFace = false;

            try
            {
                if (CtrlBioComm.GetUserFaceStr(1, p_Employee.EnrollNo, 50, ref FaceData, ref iLength))
                {
                    _IsFace = true;
                }
            }
            catch (Exception _Exception)
            {
                throw _Exception;
            }

            p_Employee.FaceTemplate = FaceData;
            p_Employee.FaceLength = iLength;
            p_Employee.IsHavingFace = _IsFace;

            return p_Employee;
        }

        private Employee GetEmployeeFingure(Employee p_Employee)
        {
            int _templatelength = 0, flag = 1;
            byte[] _enrollDataByte = new byte[1024 * 168];
            byte[] _enrollDataByte1 = new byte[1024 * 168];
            byte[] _enrollDataByte2 = new byte[1024 * 168];
            byte[] _enrollDataByte3 = new byte[1024 * 168];
            byte[] _enrollDataByte4 = new byte[1024 * 168];
            byte[] _enrollDataByte5 = new byte[1024 * 168];
            byte[] _enrollDataByte6 = new byte[1024 * 168];
            byte[] _enrollDataByte7 = new byte[1024 * 168];
            byte[] _enrollDataByte8 = new byte[1024 * 168];
            byte[] _enrollDataByte9 = new byte[1024 * 168];

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 0, out flag, out _enrollDataByte[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft = _enrollDataByte;
                }
                else
                {
                    p_Employee.finger_template_data_tft = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 1, out flag, out _enrollDataByte1[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft1 = _enrollDataByte1;
                }
                else
                {
                    p_Employee.finger_template_data_tft1 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft1 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 2, out flag, out _enrollDataByte2[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft2 = _enrollDataByte2;
                }
                else
                {

                    p_Employee.finger_template_data_tft2 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft2 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 3, out flag, out _enrollDataByte3[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft3 = _enrollDataByte3;
                }
                else
                {
                    p_Employee.finger_template_data_tft3 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft3 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 4, out flag, out _enrollDataByte4[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft4 = _enrollDataByte4;
                }
                else
                {
                    p_Employee.finger_template_data_tft4 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft4 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 5, out flag, out _enrollDataByte5[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft5 = _enrollDataByte5;
                }
                else
                {
                    p_Employee.finger_template_data_tft5 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft5 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 6, out flag, out _enrollDataByte6[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft6 = _enrollDataByte6;
                }
                else
                {
                    p_Employee.finger_template_data_tft6 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft6 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 7, out flag, out _enrollDataByte7[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft7 = _enrollDataByte7;
                }
                else
                {
                    p_Employee.finger_template_data_tft7 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft7 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 8, out flag, out _enrollDataByte8[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft8 = _enrollDataByte8;
                }
                else
                {
                    p_Employee.finger_template_data_tft8 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft8 = null;
            }

            try
            {
                if (CtrlBioComm.GetUserTmpEx(1, p_Employee.EnrollNo, 9, out flag, out _enrollDataByte9[0], out _templatelength))
                {
                    p_Employee.is_having_fingureprint = true;
                    p_Employee.finger_template_data_tft9 = _enrollDataByte9;
                }
                else
                {
                    p_Employee.finger_template_data_tft9 = null;
                }
            }
            catch
            {
                p_Employee.finger_template_data_tft9 = null;
            }

            p_Employee.is_having_fingureprint = true;
            if (p_Employee.finger_template_data_tft == null && p_Employee.finger_template_data_tft1 == null && p_Employee.finger_template_data_tft2 == null && p_Employee.finger_template_data_tft3 == null && p_Employee.finger_template_data_tft4 == null && p_Employee.finger_template_data_tft5 == null && p_Employee.finger_template_data_tft6 == null && p_Employee.finger_template_data_tft7 == null && p_Employee.finger_template_data_tft8 == null && p_Employee.finger_template_data_tft9 == null)
            {
                p_Employee.is_having_fingureprint = false;
            }

            return p_Employee;
        }

        #endregion
    }
}
