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

namespace ERP.Modules.HRAndPayRoll.Masters
{
    public partial class EducationSave : System.Web.UI.Page
    {
        #region Variables

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail == null)
            {
                Response.Redirect("~/Modules/Login.aspx", false);
            }

            this.Form.DefaultButton = "btnSave";

            SessionHelper.SelectMenuSession = "liEducation_liHR_liHRMasters";

            if (!IsPostBack)
            {
                hfId.Value = Convert.ToString(Guid.Empty);

                if (Request.QueryString["id"] != null)
                {
                    Guid _id;

                    bool _Result = Guid.TryParse(Convert.ToString(Request.QueryString["id"]), out _id);

                    if (_Result)
                    {
                        FillControls(_id);
                    }
                }
            }
        }


        #endregion


        #region Methods

        private void FillControls(Guid p_Id)
        {
            IEducationService _IEducationService = new EducationService();

            Result<Education> _Result = _IEducationService.GetEducationById(p_Id);

            if (_Result.IsSuccess)
            {
                hfId.Value = Convert.ToString(p_Id);
                txtEducation.Text = _Result.Data.EducationName;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "GetFailMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel(_Result.Message) + "');});", true);
            }
        }

        #endregion


        #region Events

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Education _Education = new Education();

                _Education.EducationID = new Guid(hfId.Value);
                _Education.EducationName = txtEducation.Text.Trim();

                IEducationService _IEducationService = new EducationService();

                Result<Boolean> _Result = _IEducationService.SaveEducation(_Education, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    SessionHelper.MessageSession = String.Format(CommonHelper.GetLanguageLabel("SaveSuccessMsg"), CommonHelper.GetLanguageLabel("Education"));

                    IHistoryService _IHistoryService = new HistoryService();

                    if (_Education.EducationID == Guid.Empty)
                    {
                        _IHistoryService.InsertHistory<Education>(_Result.Id, TableType.EducationMaster, OperationType.Insert, _Education, SessionHelper.SessionDetail.UserID);
                    }
                    else
                    {
                        _IHistoryService.InsertHistory<Education>(Convert.ToString(_Education.EducationID), TableType.EducationMaster, OperationType.Update, _Education, SessionHelper.SessionDetail.UserID);
                    }

                    Response.Redirect("~/Modules/HRAndPayRoll/Masters/EducationList.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AlreadyExistsMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Warning, Common.Variable.Warning, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("Education")) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }
       
        #endregion
    }
}