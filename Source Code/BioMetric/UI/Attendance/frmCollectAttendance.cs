using ERP.Common;
using System;
using System.Windows.Forms;

namespace BioMetric.UI.Attendance
{
    public partial class frmCollectAttendance : Form
    {
        #region Variables

        private Control _Control = null;
        private string _Message = "";

        #endregion


        #region Page events and constructor

        public frmCollectAttendance()
        {
            InitializeComponent();
        }

        private void frmCollectAttendance_Load(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;

            ClearControls();

            this.Cursor = Cursors.Default;
        }

        private void frmCollectAttendance_FormClosed(object sender, FormClosedEventArgs e)
        {
            
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
                    if (MessageBox.Show("Are you sure, you want to Collect Attendance from device(s)?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        this.Opacity = 0; this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                        this.ShowInTaskbar = this.ControlBox = this.ShowIcon = false;
                        this.Hide();

                        frmSaveCollectAttendance _frmSaveCollectAttendance = new frmSaveCollectAttendance(dtpFromDate.Value, dtpToDate.Value);
                        _frmSaveCollectAttendance.ShowInTaskbar = true;
                        _frmSaveCollectAttendance.BringToFront();
                        _frmSaveCollectAttendance.ShowDialog();

                        if (_frmSaveCollectAttendance.ErrorMessage.Trim() != "")
                        {
                            MessageBox.Show(_frmSaveCollectAttendance.ErrorMessage.Trim(), Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
                        }
                        else
                        {
                            MessageBox.Show("Data collected successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                        }
                        this.Close();
                    }

                    this.Cursor = Cursors.Default;
                }
                else
                {
                    this.Cursor = Cursors.Default;
                    MessageBox.Show(_Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    _Control.Select();
                    epCollectAttendance.SetIconPadding(_Control, 10);
                    epCollectAttendance.SetError(_Control, Messages.RequiredMsg);
                }
            }
            catch (Exception _Exception)
            {
                this.Cursor = Cursors.Default;
                throw _Exception;
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        #endregion


        #region Private Methods

        private void ClearControls()
        {
            epCollectAttendance.Clear();

            dtpFromDate.Value = DateTime.Now.Date;
            dtpToDate.Value = DateTime.Now.Date;
        }

        private bool ValidateControl()
        {
            epCollectAttendance.Clear();

            bool _Result = true; _Control = null;
            _Message = Messages.ErrorMsgTitle;

            if (!GlobalHelper.CheckRequired(dtpFromDate.Text.Trim(), ref _Message, "From Date"))
            {
                if (_Control == null)
                    _Control = dtpFromDate;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(dtpToDate.Text.Trim(), ref _Message, "To Date"))
            {
                if (_Control == null)
                    _Control = dtpToDate;
                _Result = false;
            }

            if (_Result)
            {
                if (dtpFromDate.Value > dtpToDate.Value)
                {
                    _Message += "\n ---> Please select valid date range!";
                    if (_Control == null)
                        _Control = dtpFromDate;
                    _Result = false;
                }
            }

            return _Result;
        }

        #endregion
    }
}
