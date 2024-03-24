using BioMetric.Helpers;
using ERP.Common;
using ERP.Dal;
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
    public partial class frmSaveCollectAttendance : Form
    {
        #region Variables

        public string ErrorMessage = "";
        private IDeviceService _IDeviceService = new DeviceService();
        private IEmployeeService _IEmployeeService = new EmployeeService();
        private IEmployeeDeviceMapService _IEmployeeDeviceMapService = new EmployeeDeviceMapService();
        private IEmployeeAttendanceDeviceService _IEmployeeAttendanceDeviceService = new EmployeeAttendanceDeviceService();
        private bool isFirstActivated = false, isclose = true;
        private CZKEMClass CtrlBioComm = new CZKEMClass();
        private DateTime _FromDate, _ToDate;

        #endregion


        #region Form events and constructor

        public frmSaveCollectAttendance()
        {
            InitializeComponent();
        }

        public frmSaveCollectAttendance(DateTime p_FromDate, DateTime p_ToDate)
        {
            InitializeComponent();
            _FromDate = p_FromDate;
            _ToDate = p_ToDate;
        }

        private void frmSaveCollectAttendance_Activated(object sender, EventArgs e)
        {
            try
            {
                if (!isFirstActivated)
                {
                    isFirstActivated = true;
                    this.Refresh();
                    this.Cursor = Cursors.WaitCursor;

                    ErrorMessage = SaveCollectAttendance();

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

        private void frmSaveCollectAttendance_FormClosing(object sender, FormClosingEventArgs e)
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

        private string SaveCollectAttendance()
        {
            string _ErrorMessage = string.Empty;

            DataTable _DataTable = null;
            _DataTable = new DataTable();
            _DataTable.Columns.Add("_terminalID");
            _DataTable.Columns.Add("_enrollNumber");
            _DataTable.Columns.Add("_verifyMode");
            _DataTable.Columns.Add("_inOutMode");
            _DataTable.Columns.Add("_date", typeof(DateTime));
            _DataTable.Columns.Add("_hour");
            _DataTable.Columns.Add("_minute");
            _DataTable.Columns.Add("_second");
            _DataTable.Columns.Add("_workcode");
            _DataTable.Columns.Add("_fulldate", typeof(DateTime));

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

                string _NetworkDevices = IPInfo.GetARPResult();

                if (_ListOfDevice.Where(q => _NetworkDevices.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").Count() != 0)
                {
                    List<Device> _ListOfSelectDevice = _ListOfDevice.Where(q => _NetworkDevices.Contains(Convert.ToString(q.IPAddress).Trim()) == true && Convert.ToString(q.IPAddress).Trim() != "").ToList();

                    foreach (Device _DeviceItem in _ListOfSelectDevice)
                    {
                        bool _Connected = false;

                        _Connected = CtrlBioComm.Connect_Net(_DeviceItem.IPAddress, Convert.ToInt32(_DeviceItem.Port));

                        if (_Connected)
                        {
                            if (CtrlBioComm.IsTFTMachine(1))
                            {
                                _ErrorMessage = GetAllAndUpdateData(_DeviceItem, true, _ErrorMessage, ref _DataTable);
                            }
                            else
                            {
                                _ErrorMessage = GetAllAndUpdateData(_DeviceItem, false, _ErrorMessage, ref _DataTable);
                            }

                            CtrlBioComm.Disconnect();

                            _ErrorMessage = _ErrorMessage + InsertAttendance(_DataTable, _FromDate, _ToDate, _DeviceItem.DeviceID ?? Guid.NewGuid());
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
                    _ErrorMessage = "Unable to connect device";
                }
            }

            #endregion

            return _ErrorMessage;
        }

        private string GetAllAndUpdateData(Device p_Device, bool p_IsTFT, string p_ErrorMessage, ref DataTable p_DataTable)
        {
            #region FOR MEMBER ATTENDANCE

            int _errorCode = 0, _verifyMode = 0, _inOutMode = 0, _year = 0, _month = 0, _day = 0, _hour = 0, _minute = 0, _second = 0, _workcode = 0, _reserved = 0, _dwenrollNumber = 0;
            string _enrollNumber = "";
            if (CtrlBioComm.ReadGeneralLogData(1))
            {
                CtrlBioComm.GetLastError(ref _errorCode);
                while (_errorCode != 0)
                {
                    if (p_IsTFT)
                    {
                        #region TFT MACHINES
                        if (CtrlBioComm.SSR_GetGeneralLogData(1, out _enrollNumber, out _verifyMode, out _inOutMode, out _year, out _month, out _day, out _hour, out _minute, out _second, ref _workcode))
                        {
                            DataRow newrow = p_DataTable.NewRow();
                            newrow["_terminalID"] = p_Device.DeviceID;
                            newrow["_enrollNumber"] = _enrollNumber;
                            newrow["_verifyMode"] = _verifyMode;
                            newrow["_inOutMode"] = _inOutMode;
                            newrow["_date"] = Convert.ToDateTime(_year + "-" + _month + "-" + _day + " 00:00:00 AM");
                            newrow["_hour"] = _hour;
                            newrow["_minute"] = _minute;
                            newrow["_second"] = _second;
                            newrow["_workcode"] = _workcode;
                            newrow["_fulldate"] = Convert.ToDateTime(_year + "-" + _month + "-" + _day + " " + _hour + ":" + _minute + ":" + _second);
                            p_DataTable.Rows.Add(newrow);
                        }
                        #endregion
                    }
                    else
                    {
                        #region OTHER MACHINES
                        if (CtrlBioComm.GetGeneralExtLogData(1, ref _dwenrollNumber, ref _verifyMode, ref _inOutMode, ref _year, ref _month, ref _day, ref _hour, ref _minute, ref _second, ref _workcode, ref _reserved))
                        {
                            DataRow newrow = p_DataTable.NewRow();
                            newrow["_terminalID"] = p_Device.DeviceID;
                            newrow["_enrollNumber"] = _dwenrollNumber;
                            newrow["_verifyMode"] = _verifyMode;
                            newrow["_inOutMode"] = _inOutMode;
                            newrow["_date"] = Convert.ToDateTime(_year + "-" + _month + "-" + _day + " 00:00:00 AM");
                            newrow["_hour"] = _hour;
                            newrow["_minute"] = _minute;
                            newrow["_second"] = _second;
                            newrow["_workcode"] = _workcode;
                            newrow["_fulldate"] = Convert.ToDateTime(_year + "-" + _month + "-" + _day + " " + _hour + ":" + _minute + ":" + _second);
                            p_DataTable.Rows.Add(newrow);
                        }
                        #endregion
                    }
                    CtrlBioComm.GetLastError(ref _errorCode);
                }
            }
            else
            {
                #region ERROR WHILE COOLECTING DATA
                CtrlBioComm.GetLastError(ref _errorCode);
                if (_errorCode != 0)
                {
                    if (p_ErrorMessage == "")
                    {
                        p_ErrorMessage = "Unable to collect data from " + p_Device.DeviceName + " device,  Error Code: " + Convert.ToString(_errorCode);
                    }
                    else
                    {
                        p_ErrorMessage += "\nUnable to collect data from " + p_Device.DeviceName + " device,  Error Code: " + Convert.ToString(_errorCode);
                    }
                }
                #endregion
            }
            #endregion

            return p_ErrorMessage;
        }

        private string InsertAttendance(DataTable p_DataTable, DateTime p_FromDate, DateTime p_ToDate, Guid p_DeviceId)
        {
            string p_ErrorMessage = "";
            if (p_DataTable != null && p_DataTable.Rows.Count > 0)
            {
                DataRow[] _Rows = null;

                _Rows = p_DataTable.AsEnumerable().Where(q => (Convert.ToDateTime(q["_date"]).Date >= p_FromDate) && (Convert.ToDateTime(q["_date"]).Date <= p_ToDate)).OrderBy(q => q.Field<DateTime>("_fulldate")).ToArray();

                if (_Rows != null && _Rows.Count() > 0)
                {
                    DataTable _DataTableEmployeeEnroll = null;
                    Result<DataTable> _ResultEmployeeEnroll = _IEmployeeDeviceMapService.GetEmployeeEnrolls(p_DeviceId);

                    if (_ResultEmployeeEnroll.IsSuccess)
                    {
                        _DataTableEmployeeEnroll = _ResultEmployeeEnroll.Data;
                    }

                    if (_DataTableEmployeeEnroll != null && _DataTableEmployeeEnroll.Rows.Count > 0)
                    {
                        foreach (DataRow dr in _Rows)
                        {
                            EmployeeAttendanceDevices _EmployeeAttendance = new EmployeeAttendanceDevices();

                            _EmployeeAttendance.EnrollNo = Convert.ToString(dr["_enrollNumber"]);
                            _EmployeeAttendance.DeviceId = p_DeviceId;
                            _EmployeeAttendance.PunchMethod = Convert.ToString(PunchMethod.IN);
                            _EmployeeAttendance.AttendanceDate = Convert.ToDateTime(dr["_date"]);
                            _EmployeeAttendance.PunchTime = Convert.ToString(dr["_hour"]) + ":" + Convert.ToString(dr["_minute"]) + ":" + Convert.ToString(dr["_second"]);
                            _EmployeeAttendance.VerifyMethod = Convert.ToString(dr["_verifyMode"]);
                            _EmployeeAttendance.AttendanceDateTime = Convert.ToDateTime(dr["_fulldate"]);

                            DataRow[] _DataRow = _DataTableEmployeeEnroll.AsEnumerable().Where(q => (Convert.ToString(q["EnrollNo"]) == _EmployeeAttendance.EnrollNo)).ToArray();

                            bool _IsAllow = true;
                            if (_DataRow != null && _DataRow.Count() > 0)
                            {
                                _EmployeeAttendance.EmployeeId = new Guid(Convert.ToString(_DataRow[0]["EmployeeId"]));
                            }
                            else
                            {
                                _IsAllow = false;
                            }

                            _EmployeeAttendance.PunchMethod = Convert.ToString(PunchMethod.IN);

                            if (_IsAllow)
                            {
                                Result<DataTable> _ResultAttendanceEmployee = _IEmployeeAttendanceDeviceService.GetEmployeeAttendanceTimeByEmpoyeeIdAndDate(_EmployeeAttendance.EmployeeId, Convert.ToDateTime(dr["_date"]));

                                if (_ResultAttendanceEmployee.IsSuccess)
                                {
                                    if (_ResultAttendanceEmployee.Data != null && _ResultAttendanceEmployee.Data.Rows.Count > 0)
                                    {
                                        if (_ResultAttendanceEmployee.Data.AsEnumerable().Where(q => (Convert.ToString(q["PunchTime"]) == Convert.ToString(_EmployeeAttendance.PunchTime))).Count() > 0)
                                        {
                                            _IsAllow = false;
                                        }
                                        else
                                        {
                                            if ((_ResultAttendanceEmployee.Data.Rows.Count % 2) == 0)
                                            {
                                                _EmployeeAttendance.PunchMethod = Convert.ToString(PunchMethod.IN);
                                            }
                                            else
                                            {
                                                _EmployeeAttendance.PunchMethod = Convert.ToString(PunchMethod.OUT);
                                            }
                                        }
                                    }
                                }
                            }

                            if (_IsAllow)
                            {
                                //Insert Attendance

                                Result<bool> _ResultSave = _IEmployeeAttendanceDeviceService.SaveEmployeeAttendance(_EmployeeAttendance);

                                if (!_ResultSave.IsSuccess)
                                {
                                    p_ErrorMessage = _ResultSave.Message;
                                }
                            }
                        }
                    }
                }
                //else
                //{
                //    p_ErrorMessage = Messages.NoRecordMsg;
                //}
            }
            //else
            //{
            //    p_ErrorMessage = Messages.NoRecordMsg;
            //}

            return p_ErrorMessage;
        }

        #endregion
    }
}
