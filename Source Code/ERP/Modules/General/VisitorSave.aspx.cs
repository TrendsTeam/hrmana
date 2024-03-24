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

namespace ERP.Modules.General
{
    public partial class VisitorSave : System.Web.UI.Page
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

            SessionHelper.SelectMenuSession = "liVisitor";

            if (!IsPostBack)
            {
                txtVisitInDateTime.Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm tt");
                txtVisitOutDateTime.Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm tt");

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


        #region Events

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Visit _Visit = new Visit();

                _Visit.VisitID = new Guid(hfId.Value);
                _Visit.FullName = txtFullName.Text;
                _Visit.NoOfPerson = Convert.ToInt32(ddlNoOfPerson.SelectedValue);
                _Visit.EmailAddress = txtEmail.Text;
                _Visit.MobileNo = txtMobile.Text;
                _Visit.Address = txtAddress.Text;
                _Visit.VisitToName = txtVisitToName.Text;
                _Visit.Relation = txtRelation.Text;
                _Visit.VisitReference = txtVisitReference.Text;
                _Visit.Purpose = txtPurpose.Text;

                _Visit.VisitInDateTime = ConvertDateTimeToString(txtVisitInDateTime.Value);
                _Visit.VisitOutDateTime = ConvertDateTimeToString(txtVisitOutDateTime.Value);

                IVisitService _IVisitService = new VisitService();

                Result<Boolean> _Result = _IVisitService.SaveVisit(_Visit, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    SessionHelper.MessageSession = String.Format(CommonHelper.GetLanguageLabel("SaveSuccessMsg"), CommonHelper.GetLanguageLabel("Visitor"));

                    IHistoryService _IHistoryService = new HistoryService();

                    if (_Visit.VisitID == Guid.Empty)
                    {
                        _IHistoryService.InsertHistory<Visit>(_Result.Id, TableType.VisitMaster, OperationType.Insert, _Visit, SessionHelper.SessionDetail.UserID);
                    }
                    else
                    {
                        _IHistoryService.InsertHistory<Visit>(Convert.ToString(_Visit.VisitID), TableType.AllowanceMaster, OperationType.Update, _Visit, SessionHelper.SessionDetail.UserID);
                    }

                    Response.Redirect("~/Modules/General/VisitorList.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AlreadyExistsMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Warning, Common.Variable.Warning, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("Visitor")) + "');});", true);
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

        private void FillControls(Guid p_Id)
        {
            try
            {
                IVisitService _IVisitService = new VisitService();

                Result<Visit> _Result = _IVisitService.GetVisitById(p_Id);

                if (_Result.IsSuccess)
                {
                    hfId.Value = Convert.ToString(p_Id);
                    txtFullName.Text = _Result.Data.FullName;
                    ddlNoOfPerson.SelectedValue = _Result.Data.NoOfPerson.ToString();
                    txtEmail.Text = _Result.Data.EmailAddress;
                    txtMobile.Text = _Result.Data.MobileNo;
                    txtAddress.Text = _Result.Data.Address;
                    txtVisitToName.Text = _Result.Data.VisitToName;
                    txtRelation.Text = _Result.Data.Relation;
                    txtVisitReference.Text = _Result.Data.VisitReference;
                    txtPurpose.Text = _Result.Data.Purpose;
                    txtVisitInDateTime.Value = _Result.Data.VisitInDateTime.ToString("dd/MM/yyyy hh:mm tt");
                    txtVisitOutDateTime.Value = _Result.Data.VisitOutDateTime.ToString("dd/MM/yyyy hh:mm tt");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "GetFailMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel(_Result.Message) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        private DateTime ConvertDateTimeToString(string p_Input)
        {
            DateTime _DateTime = DateTime.Now;

            if(!string.IsNullOrEmpty(p_Input))
            {
                string[] _SpitDateTime = p_Input.Split(' ');

                if (_SpitDateTime.Length>2)
                {
                    string[] _SpitDate = _SpitDateTime[0].Split('/');
                    string[] _SpitTime = _SpitDateTime[1].Split(':');

                    int _Hour = 0;

                    if (_SpitDateTime[2]=="PM")
                    {
                        _Hour = 12;
                    }

                    _DateTime = new DateTime(Convert.ToInt32(_SpitDate[2]), Convert.ToInt32(_SpitDate[1]), Convert.ToInt32(_SpitDate[0]), Convert.ToInt32(_SpitTime[0])+_Hour, Convert.ToInt32(_SpitTime[1]),0);
                }
            }

            return _DateTime;
        }

        #endregion
    }
}