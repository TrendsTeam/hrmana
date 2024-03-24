using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace BioMetric.UI
{
    public partial class frmSaveDevice : Form
    {
        #region Variables

        private IDeviceService _IDeviceService = new DeviceService();
        private Guid? _DeviceId = null;
        private Control _Control = null;
        private string _Message = "";
        private bool _IsRefresh = false;

        #endregion

        #region Page events and constructor

        public frmSaveDevice()
        {
            InitializeComponent();
        }

        public frmSaveDevice(Guid? p_Id)
        {
            InitializeComponent();
            _DeviceId = p_Id;
        }

        private void frmSaveDevice_Load(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;

            FillControls();

            this.Cursor = Cursors.Default;
        }

        private void frmSaveDevice_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (_IsRefresh)
            {
                frmDevice _frmDevice = (frmDevice)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmDevice").FirstOrDefault();
                if (_frmDevice != null)
                {
                    _frmDevice.Focus();
                    _frmDevice.FillDeviceDataTable();
                    _frmDevice.FillGrid();
                }
                else
                {
                    _frmDevice = new frmDevice();
                    _frmDevice.Show();
                    _frmDevice.Focus();
                }
            }
        }

        #endregion

        #region Button Events

        private void btnExist_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.Cursor = Cursors.WaitCursor;
                if (ValidateControl())
                {
                    SaveDevice();

                    this.Cursor = Cursors.Default;
                }
                else
                {
                    this.Cursor = Cursors.Default;
                    MessageBox.Show(_Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    _Control.Select();
                    epDevice.SetIconPadding(_Control, 10);
                    epDevice.SetError(_Control, Messages.RequiredMsg);
                }
            }
            catch
            {
                this.Cursor = Cursors.Default;
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            if (_DeviceId != null)
            {
                FillControls();
            }
            else
            {
                ClearControls();
            }
        }

        private void txtNumber_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        #endregion

        #region Private Methods

        private void FillControls()
        {
            txtDeviceName.Select();

            if (_DeviceId != null)
            {
                Result<Device> _Result = _IDeviceService.GetDeviceById(_DeviceId.Value);

                if (_Result.IsSuccess)
                {
                    txtDeviceName.Text = _Result.Data.DeviceName;
                    txtAddress.Text = _Result.Data.Address;
                    txtDeviceCode.Text = _Result.Data.DeviceCode;
                    txtPhoneNo.Text = _Result.Data.PhoneNo;
                    txtPort.Text = _Result.Data.Port;
                    txtIPAddress.Text = _Result.Data.IPAddress;
                }
                else
                {
                    this.Close();
                }
            }
        }

        private void ClearControls()
        {
            epDevice.Clear();
            txtDeviceName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtDeviceCode.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtPort.Text = string.Empty;
            txtIPAddress.Text = string.Empty;
        }

        private bool ValidateControl()
        {
            epDevice.Clear();

            bool _Result = true; _Control = null;
            _Message = Messages.ErrorMsgTitle;

            if (!GlobalHelper.CheckRequired(txtDeviceName.Text.Trim(), ref _Message, "Device Name"))
            {
                if (_Control == null)
                    _Control = txtDeviceName;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(txtAddress.Text.Trim(), ref _Message, "Address"))
            {
                if (_Control == null)
                    _Control = txtAddress;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(txtDeviceCode.Text.Trim(), ref _Message, "Device Code"))
            {
                if (_Control == null)
                    _Control = txtDeviceCode;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(txtPort.Text.Trim(), ref _Message, "Port"))
            {
                if (_Control == null)
                    _Control = txtPort;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(txtIPAddress.Text.Trim(), ref _Message, "IP Address"))
            {
                if (_Control == null)
                    _Control = txtIPAddress;
                _Result = false;
            }
            else if (!IsValidIP(txtIPAddress.Text.Trim()))
            {
                _Message += "\n ---> Enter Valid IP Address !";
                if (_Control == null)
                    _Control = txtIPAddress;
                _Result = false;
            }

            if (_Result)
            {
                Result<bool> _ResultData = _IDeviceService.CheckDuplicateDevice(txtDeviceName.Text.Trim(), _DeviceId);

                if (_ResultData.IsSuccess)
                {
                    if (!_ResultData.Data)
                    {
                        _Result = true;
                    }
                    else
                    {
                        txtDeviceName.Select();
                        _Result = false;
                        _Message = string.Format(Messages.DuplicateMsg, "Device Name");
                        if (_Control == null)
                            _Control = txtDeviceName;
                    }
                }
                else
                {
                    txtDeviceName.Select();
                    _Result = false;
                    _Message = _ResultData.Message;
                    if (_Control == null)
                        _Control = txtDeviceName;
                }
            }

            return _Result;
        }

        public bool IsValidIP(string addr)
        {
            string pattern = @"\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b";
            Regex check = new Regex(pattern);
            bool valid = false;
            if (addr == "")
            {
                valid = false;
            }
            else
            {
                valid = check.IsMatch(addr, 0);
            }
            return valid;
        }

        private void SaveDevice()
        {
            Device _Device = new Device();

            _Device.DeviceID = _DeviceId;
            _Device.DeviceName = txtDeviceName.Text.Trim();
            _Device.Address = txtAddress.Text.Trim();
            _Device.DeviceCode = txtDeviceCode.Text.Trim();
            _Device.PhoneNo = txtPhoneNo.Text.Trim();
            _Device.Port = txtPort.Text.Trim();
            _Device.IPAddress = txtIPAddress.Text.Trim();

            Result<bool> _Result = _IDeviceService.SaveDevice(_Device, new Guid(Properties.Settings.Default.UserId));

            if (_Result.IsSuccess)
            {
                MessageBox.Show(string.Format(Messages.RecordSaveSuccessMsg, "Device"), Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information);
                _IsRefresh = true;
                this.Close();
            }
            else
            {
                MessageBox.Show(_Result.Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #endregion
    }
}
