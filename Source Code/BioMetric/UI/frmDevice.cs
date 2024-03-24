using BioMetric.Helpers;
using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using zkemkeeper;

namespace BioMetric.UI
{
    public partial class frmDevice : Form
    {
        #region Variables

        private IDeviceService _IDeviceService = new DeviceService();
        private DataTable _DeviceDataTable = null;
        public int _PageId = 0;
        private CZKEMClass CtrlBioComm = new CZKEMClass();

        #endregion


        #region Page events and constructor

        public frmDevice()
        {
            InitializeComponent();
        }

        private void frmDevice_Load(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;

            FillDeviceDataTable();

            gvDevice.AutoGenerateColumns = false;

            FillGrid();

            this.Cursor = Cursors.Default;
        }

        #endregion


        #region Button Events
        
        private void btnExist_Click(object sender, EventArgs e)
        {
            this.Close();
        }
       
        private void gvDevice_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex != -1 && e.RowIndex != -1)
            {
                int rowindex = gvDevice.CurrentCell.RowIndex;
                int colindex = gvDevice.CurrentCell.ColumnIndex;
                Guid _Id = new Guid(gvDevice.Rows[rowindex].Cells["DeviceID"].Value.ToString());

                if (gvDevice.Columns[colindex].Name == "Edit")
                {
                    OpenSaveDevice(_Id);
                }
                else if (gvDevice.Columns[colindex].Name == "Delete")
                {
                    if (MessageBox.Show(string.Format(Messages.DeleteMsg, "Device"), Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        Result<bool> _Result = _IDeviceService.DeleteDeviceById(_Id, new Guid(Properties.Settings.Default.UserId));

                        if (_Result.IsSuccess)
                        {
                            DataRow[] _DataRow = _DeviceDataTable.Select("DeviceID='" + new Guid(_Id.ToString()) + "'");
                            if (_DataRow.Count() > 0)
                            {
                                _DeviceDataTable.Rows.Remove(_DataRow[0]);
                                _DeviceDataTable.AcceptChanges();
                            }

                            FillGrid();
                        }
                        else
                        {
                            MessageBox.Show(_Result.Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            OpenSaveDevice(null);
        }

        private void button_connect_Click(object sender, EventArgs e)
        {
            if (gvDevice.Rows.Count > 0)
            {
                this.Cursor = Cursors.WaitCursor;
                ConnectDevice();
                this.Cursor = Cursors.Default;
            }
        }

        private void button_disconnect_Click(object sender, EventArgs e)
        {
            try
            {
                DataGridViewRow[] grows = gvDevice.Rows.Cast<DataGridViewRow>().Where(q => Convert.ToString(q.Cells["ConnectionStatus"].Value) == Convert.ToString(ConnectionStatusValue.Connected) && Convert.ToBoolean(q.Cells["chkDevice"].Value) == true).ToArray();

                if (grows.Count() > 0)
                {
                    this.Cursor = Cursors.WaitCursor;

                    foreach (DataGridViewRow desired_row in grows)
                    {
                        CtrlBioComm.Disconnect();

                        desired_row.Cells["ConnectionStatus"].Value = Convert.ToString(ConnectionStatusValue.DisConnected);

                        DataRow[] _DataRow = _DeviceDataTable.Select("DeviceID='" + Convert.ToString(new Guid(desired_row.Cells["DeviceID"].Value.ToString())) + "'");
                        if (_DataRow.Count() > 0)
                        {
                            _DataRow[0]["ConnectionStatus"] = Convert.ToString(ConnectionStatusValue.DisConnected);
                        }
                    }

                    this.Cursor = Cursors.Default;
                }
                else
                {
                    MessageBox.Show("There is no device connected!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
            }
        }

        private void checkBox_selectAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in gvDevice.Rows)
            {
                row.Cells["chkDevice"].Value = checkBox_selectAll.Checked;
            }
        }

        #endregion


        #region Private Methods

        public void FillDeviceDataTable()
        {
            Result<DataTable> _Result = _IDeviceService.GetAllDevice();

            if (_Result.IsSuccess)
            {
                _DeviceDataTable = _Result.Data;
            }
        }

        public void FillGrid()
        {
            this.Cursor = Cursors.WaitCursor;

            gvDevice.DataSource = null;
            gvDevice.Rows.Clear();

            DataTable _DataTable = _DeviceDataTable;

            if (_DeviceDataTable != null)
            {
                gvDevice.DataSource = _DeviceDataTable;
            }

            this.Cursor = Cursors.Default;
        }

        private void OpenSaveDevice(Guid? p_Id)
        {
            frmSaveDevice _frmSaveDevice = (frmSaveDevice)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmSaveDevice").FirstOrDefault();
            if (_frmSaveDevice != null)
            {
                _frmSaveDevice.Focus();
            }
            else
            {
                _frmSaveDevice = new frmSaveDevice(p_Id);
                _frmSaveDevice.Show();
                _frmSaveDevice.Focus();
            }
        }

        private void ConnectDevice()
        {
            try
            {
                foreach (DataGridViewRow _Row in gvDevice.Rows)
                {
                    if (Convert.ToBoolean(_Row.Cells["chkDevice"].Value) == true)
                    {
                        CommonFunction.Connect(Convert.ToString(_Row.Cells["IPAddress"].Value));
                    }
                }

                DataGridViewRow[] desired_row_collection = gvDevice.Rows.Cast<DataGridViewRow>().Where(q => Convert.ToBoolean(q.Cells["chkDevice"].Value) == true).ToArray();
                foreach (DataGridViewRow desired_row in desired_row_collection)
                {
                    bool _Connected = false;
                    try
                    {
                        _Connected = CtrlBioComm.Connect_Net(Convert.ToString(desired_row.Cells["IPAddress"].Value), Convert.ToInt32(desired_row.Cells["Port"].Value));

                        if (_Connected)
                        {
                            desired_row.Cells["ConnectionStatus"].Value = Convert.ToString(ConnectionStatusValue.Connected);

                            DataRow[] _DataRow = _DeviceDataTable.Select("DeviceId=" + desired_row.Cells["Id"].Value);
                            if (_DataRow.Count() > 0)
                            {
                                _DataRow[0]["ConnectionStatus"] = Convert.ToString(ConnectionStatusValue.Connected);
                            }
                        }
                    }
                    catch
                    {

                    }
                }
            }
            catch
            {

            }
        }

        #endregion
    }
}
