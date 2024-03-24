using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Helpers;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules
{
    public partial class Login : System.Web.UI.Page
    {
        #region Variables

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = "btnLogin";

            if (!IsPostBack)
            {
                SessionHelper.RemoveSessionDetail();

                if (!string.IsNullOrEmpty(SessionHelper.MessageSession))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "SaveSuccessMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Success, Common.Variable.Success, '" + SessionHelper.MessageSession + "');});", true);
                    SessionHelper.RemoveMessageSession();
                }

                if (Request.Cookies["ERPUserName"] != null && Request.Cookies["ERPPassword"] != null)
                {
                    txtUserName.Text = Request.Cookies["ERPUserName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["ERPPassword"].Value;
                    chkRememberMe.Checked = true;
                }

                //FillFinancialYear();
            }
        }

        #endregion


        #region Events

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkRememberMe.Checked)
                {
                    Response.Cookies["ERPUserName"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["ERPPassword"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["ERPUserName"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["ERPPassword"].Expires = DateTime.Now.AddDays(-1);
                }

                Response.Cookies["ERPUserName"].Value = txtUserName.Text.Trim();
                Response.Cookies["ERPPassword"].Value = txtPassword.Text.Trim();

                IUserService _IUserService = new UserService();

                Result<SessionDetail> _Result = _IUserService.CheckLogin(txtUserName.Text.Trim(), SecurityHelper.EncryptString(txtPassword.Text.Trim()));

                if (_Result.IsSuccess)
                {
                    SessionHelper.SessionDetail = _Result.Data;

                    //SessionHelper.SessionDetail.FinancialYearId = new Guid(ddlFinancialYear.SelectedValue);

                    Response.Redirect("~/Modules/Main.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AuthenticationFailMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel(_Result.Message) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        #endregion


        #region Methods

        //private void FillFinancialYear()
        //{
        //    IFinancialYearService _IFinancialYearService = new FinancialYearService();
        //    Result<List<FinancialYear>> _Result = _IFinancialYearService.GetFinancialYearList();

        //    if (_Result.IsSuccess)
        //    {
        //        ddlFinancialYear.DataTextField = "FinancialMonthText";
        //        ddlFinancialYear.DataValueField = "FinancialYearId";
        //        ddlFinancialYear.DataSource = _Result.Data;
        //        ddlFinancialYear.DataBind();

        //        if (_Result.Data != null && _Result.Data.Count() > 0)
        //        {
        //            ddlFinancialYear.SelectedValue = Convert.ToString(_Result.Data.OrderByDescending(f => f.Year).Select(f => f.FinancialYearId).FirstOrDefault());
        //        }
        //    }

        //    ddlFinancialYear.Items.Insert(0, new ListItem() { Text = GlobalHelper.GetLanguageLabel("Select"), Value = "" });
        //}

        #endregion
    }
}