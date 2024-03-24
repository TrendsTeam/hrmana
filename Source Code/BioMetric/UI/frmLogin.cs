using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Windows.Forms;

namespace BioMetric.UI
{
    public partial class frmLogin : Form
    {
        #region Variables

        private Control _Control = null;
        private string _Message = "";

        #endregion


        #region Page events and constructor

        public frmLogin()
        {
            InitializeComponent();
            epLogin.Clear();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            txtUsername.Select();
        }

        #endregion


        #region Button Events

        private void btnCancel_Click(object sender, EventArgs e)
        {
            CloseApplication();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {

            this.Cursor = Cursors.WaitCursor;
            if (ValidateControl())
            {
                IUserService _IUserService = new UserService();

                Result<String> _Result = _IUserService.CheckBioMetricLogin(txtUsername.Text.Trim(), SecurityHelper.EncryptString(txtPassword.Text.Trim()));

                if (_Result.IsSuccess)
                {
                    this.Cursor = Cursors.Default;

                    Properties.Settings.Default.UserId =_Result.Data;

                    this.Hide();
                    frmMaster _frmMaster = new frmMaster();
                    _frmMaster.ShowDialog();
                }
                else
                {
                    this.Cursor = Cursors.Default;
                    MessageBox.Show(_Result.Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtUsername.Select();
                }
            }
            else
            {
                this.Cursor = Cursors.Default;
                MessageBox.Show(_Message, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                _Control.Select();
                epLogin.SetIconPadding(_Control, 10);
                epLogin.SetError(_Control, Messages.RequiredMsg);
            }
        }

        private void txtUsername_Validated(object sender, EventArgs e)
        {
            epLogin.Clear();
        }

        private void txtPassword_Validated(object sender, EventArgs e)
        {
            epLogin.Clear();
        }

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            CloseApplication();
        }

        #endregion


        #region Private Methods

        private void CloseApplication()
        {
            DialogResult dlgrslt = MessageBox.Show(Messages.ExitMsg, Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlgrslt == DialogResult.No)
            {
                txtUsername.Select();
            }
            else
            {
                Application.ExitThread();
                Application.Exit();
            }
        }

        private bool ValidateControl()
        {
            bool _Result = true; _Control = null;
            _Message = Messages.ErrorMsgTitle;

            if (!GlobalHelper.CheckRequired(txtUsername.Text.Trim(), ref _Message, "User Name"))
            {
                if (_Control == null)
                    _Control = txtUsername;
                _Result = false;
            }

            if (!GlobalHelper.CheckRequired(txtPassword.Text.Trim(), ref _Message, "Password"))
            {
                if (_Control == null)
                    _Control = txtPassword;
                _Result = false;
            }

            return _Result;
        }

        #endregion
    }
}
