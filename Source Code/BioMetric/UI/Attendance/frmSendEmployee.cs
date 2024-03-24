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
    public partial class frmSendEmployee : Form
    {
        #region Variables

        public string ErrorMessage = "";
        private IDeviceService _IDeviceService = new DeviceService();
        private IEmployeeService _IEmployeeService = new EmployeeService();
        private IEmployeeDeviceMapService _IEmployeeDeviceMapService = new EmployeeDeviceMapService();
        private bool isFirstActivated = false, isclose = true;
        private CZKEMClass CtrlBioComm = new CZKEMClass();

        #endregion


        #region Page events and constructor

        public frmSendEmployee()
        {
            InitializeComponent();
        }

        private void frmSendEmployee_Activated(object sender, EventArgs e)
        {
            try
            {
                if (!isFirstActivated)
                {
                    isFirstActivated = true;
                    this.Refresh();
                    this.Cursor = Cursors.WaitCursor;

                    ErrorMessage = SendEmployee();

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

        private void frmSendEmployee_FormClosing(object sender, FormClosingEventArgs e)
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

        private string SendEmployee()
        {
            string _ErrorMessage = string.Empty;

            try
            {
                #region CONNECT DEVICE

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

                    string _Test = IPInfo.GetARPResult();

                    if (_ListOfDevice.Where(q => _Test.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").Count() != 0)
                    {
                        List<Device> _ListOfSelectDevice = _ListOfDevice.Where(q => _Test.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").ToList();

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
            int _errorCode = 0, _machinePrivilege = 0, _enrollid = 1;
            string _enrollNo = "", _name = "", _password = "";
            bool _enabled = false, _uploadedtodevice = false;
            List<int> _ListEnrollId = new List<int>();

            #region FOR MEMBER CHECK

            if (CtrlBioComm.ReadAllUserID(1))
            {
                CtrlBioComm.GetLastError(ref _errorCode);

                _ListEnrollId = new List<int>();

                while (_errorCode != 0)
                {
                    CtrlBioComm.ReadAllUserID(1);

                    if (p_IsTFT)
                    {
                        while (CtrlBioComm.SSR_GetAllUserInfo(1, out _enrollNo, out _name, out _password, out _machinePrivilege, out _enabled))
                        {
                            _ListEnrollId.Add(Convert.ToInt32(_enrollNo));
                        }
                    }
                    else
                    {
                        int _enrollNoInt = 0;
                        while (CtrlBioComm.GetAllUserInfo(1, ref _enrollNoInt, ref _name, ref _password, ref _machinePrivilege, ref _enabled))
                        {
                            _ListEnrollId.Add(_enrollNoInt);
                        }
                    }

                    CtrlBioComm.GetLastError(ref _errorCode);
                }

                _enrollid = _ListEnrollId.Max() + 1;
            }

            #endregion

            List<Employee> _ListOfEmployee = null;

            Result<List<Employee>> _ResultEmployee = _IEmployeeService.GetAllSendPendingEmployeeByDevice(p_Device.DeviceID ?? Guid.NewGuid());

            if (_ResultEmployee.IsSuccess)
            {
                _ListOfEmployee = _ResultEmployee.Data;

                if (_ListOfEmployee != null)
                {
                    foreach (Employee _Employee in _ListOfEmployee)
                    {
                        _uploadedtodevice = false;

                        string _Names = _Employee.FullName.Length >= 30 ? _Employee.FullName.Substring(0, 29) : _Employee.FullName;

                        if (CtrlBioComm.SSR_SetUserInfo(1, Convert.ToString(_enrollid), _Names, "123456", 0, true))
                        {
                            _uploadedtodevice = true;
                        }
                        else
                        {
                            if (CtrlBioComm.SetUserInfo(1, _enrollid, _Names, "123456", 0, true))
                            {
                                _uploadedtodevice = true;
                            }
                        }

                        if (_uploadedtodevice)
                        {

                            EmployeeDeviceMaps _EmployeeDeviceMap = new EmployeeDeviceMaps();

                            _EmployeeDeviceMap.DeviceId = p_Device.DeviceID;
                            _EmployeeDeviceMap.EmployeeId = _Employee.EmployeeID;
                            _EmployeeDeviceMap.EnrollmentNo = Convert.ToString(_enrollid);

                            Result<bool> _ResultSave = _IEmployeeDeviceMapService.InsertEmployeeDeviceAttendance(_EmployeeDeviceMap);

                            if (_ResultSave.IsSuccess)
                            {
                                _enrollid = _enrollid + 1;
                            }
                        }
                    }
                }
            }

            return p_ErrorMessage;
        }

        #endregion
    }
}
