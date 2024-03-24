using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Helpers;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules.General
{
    public partial class CompanySave : System.Web.UI.Page
    {
        #region Variables

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        ILookupService _ILookupService = new LookupService();
        ICompanyService _ICompanyService = new CompanyService();

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail == null)
            {
                Response.Redirect("~/Modules/Login.aspx", false);
            }

            SessionHelper.SelectMenuSession = "liGeneralSettings";

            if (!IsPostBack)
            {
                FillCountry();

                FillControls();
            }
        }

        #endregion


        #region Events

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillState();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Company _Company = new Company();
                _Company.CompanyID = new Guid(hfId.Value);
                _Company.CompanyName = txtCompanyName.Text.Trim();
                _Company.EmailAddress = txtEmail.Text.Trim();
                _Company.CountryId = new Guid(ddlCountry.SelectedValue);
                _Company.StateId = new Guid(ddlState.SelectedValue);
                _Company.City = txtCity.Text.Trim();
                _Company.Address = txtAddress.Text.Trim();
                _Company.MobileNo = txtMobile.Text.Trim();
                _Company.PhoneNo = txtPhone.Text.Trim();
                _Company.HotLineNo = txtHotlineNo.Text.Trim();
                _Company.FaxNo = txtFaxNo.Text.Trim();
                _Company.WebSite = txtWebSite.Text.Trim();
                _Company.UserEmailId = txtUserEmail.Text.Trim();
                _Company.UserEmailPassword = txtUserEmailPassword.Text.Trim();
                _Company.IsEnableSSL = chkIsEnableSSL.Checked;
                _Company.SMTPHost = txtSMTPHost.Text.Trim();
                _Company.SMTPPort = Convert.ToInt32(txtSMTPPort.Text.Trim());
                _Company.FromEmailId = txtFromEmail.Text.Trim();
                _Company.ToEmailId = txtReceiveEmail.Text.Trim();

                if (fuLogo.HasFile)
                {
                    _Company.CompanyLogo = Convert.ToString(Guid.NewGuid()) + Path.GetExtension(fuLogo.FileName).ToLower();
                }

                Result<Boolean> _Result = _ICompanyService.SaveCompany(_Company, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    if (!string.IsNullOrEmpty(_Company.CompanyLogo))
                    {
                        string _PhotoRootPath = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["ImagePath"] + UploadFileFolderName.CompanyLogo + "/");

                        if (!Directory.Exists(_PhotoRootPath))
                        {
                            Directory.CreateDirectory(_PhotoRootPath);
                        }

                        if (!string.IsNullOrEmpty(hfLogo.Value))
                        {
                            string _PhotoFilePath = _PhotoRootPath + hfLogo.Value;

                            if (File.Exists(_PhotoFilePath))
                            {
                                File.Delete(_PhotoFilePath);
                            }
                        }

                        fuLogo.SaveAs(_PhotoRootPath + _Company.CompanyLogo);
                    }

                    SessionHelper.MessageSession = String.Format(CommonHelper.GetLanguageLabel("SaveSuccessMsg"), CommonHelper.GetLanguageLabel("Company"));

                    IHistoryService _IHistoryService = new HistoryService();

                    if (_Company.CompanyID == Guid.Empty)
                    {
                        _IHistoryService.InsertHistory<Company>(_Result.Id, TableType.CompanyMaster, OperationType.Insert, _Company, SessionHelper.SessionDetail.UserID);
                    }
                    else
                    {
                        _IHistoryService.InsertHistory<Company>(Convert.ToString(_Company.CompanyID), TableType.CompanyMaster, OperationType.Update, _Company, SessionHelper.SessionDetail.UserID);
                    }

                    Response.Redirect("~/Modules/Main.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AlreadyExistsMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Warning, Common.Variable.Warning, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("Company")) + "');});", true);
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

        private void FillCountry()
        {
            Result<List<Item>> _Result = _ILookupService.GetAllCountry();

            if (_Result.IsSuccess)
            {
                ddlCountry.DataTextField = "Text";
                ddlCountry.DataValueField = "Id";
                ddlCountry.DataSource = _Result.Data;
                ddlCountry.DataBind();
            }

            ddlCountry.Items.Insert(0, new ListItem() { Text = CommonHelper.GetLanguageLabel("Select"), Value = "" });
        }

        private void FillState()
        {
            ddlState.Items.Clear();

            string _CountryId = ddlCountry.SelectedValue;

            if (!string.IsNullOrEmpty(_CountryId))
            {
                Result<List<Item>> _Result = _ILookupService.GetAllStateByCountryId(new Guid(_CountryId));

                if (_Result.IsSuccess)
                {
                    ddlState.DataTextField = "Text";
                    ddlState.DataValueField = "Id";
                    ddlState.DataSource = _Result.Data;
                    ddlState.DataBind();
                }

                ddlState.Items.Insert(0, new ListItem() { Text = CommonHelper.GetLanguageLabel("Select"), Value = "" });
            }
        }

        private void FillControls()
        {
            try
            {
                hfId.Value = Convert.ToString(Guid.Empty);

                Result<Company> _Result = _ICompanyService.GetCompany();

                if (_Result.IsSuccess)
                {
                    hfId.Value = Convert.ToString(_Result.Data.CompanyID);
                    txtCompanyName.Text = _Result.Data.CompanyName;
                    txtEmail.Text = _Result.Data.EmailAddress;
                    ddlCountry.SelectedValue = Convert.ToString(_Result.Data.CountryId);

                    FillState();

                    ddlState.SelectedValue = Convert.ToString(_Result.Data.StateId);
                    txtCity.Text = _Result.Data.City;
                    txtAddress.Text = _Result.Data.Address;
                    txtMobile.Text = _Result.Data.MobileNo;
                    txtPhone.Text = _Result.Data.PhoneNo;
                    txtHotlineNo.Text = _Result.Data.HotLineNo;
                    txtFaxNo.Text = _Result.Data.FaxNo;
                    txtWebSite.Text = _Result.Data.WebSite;
                    txtUserEmail.Text = _Result.Data.UserEmailId;
                    txtUserEmailPassword.Text = _Result.Data.UserEmailPassword;
                    chkIsEnableSSL.Checked = _Result.Data.IsEnableSSL;
                    txtSMTPHost.Text = _Result.Data.SMTPHost;
                    txtSMTPPort.Text = Convert.ToString(_Result.Data.SMTPPort);
                    txtFromEmail.Text = _Result.Data.FromEmailId;
                    txtReceiveEmail.Text = _Result.Data.ToEmailId;

                    if (!string.IsNullOrEmpty(_Result.Data.CompanyLogo))
                    {
                        string _FilePath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"] + UploadFileFolderName.CompanyLogo + "/" + _Result.Data.CompanyLogo;

                        if (File.Exists(Server.MapPath(_FilePath)))
                        {
                            imgLogo.Src = _FilePath;
                            divUploadLogo.Style.Add("display", "none");
                            divViewLogo.Style.Add("display", "block");
                            rfvLogo.Enabled = false;
                            revLogo.Enabled = false;
                            hfLogo.Value = _Result.Data.CompanyLogo;
                        }
                    }
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        #endregion

    }
}