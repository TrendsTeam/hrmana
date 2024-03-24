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
    public partial class VisitorList : System.Web.UI.Page
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

            SessionHelper.SelectMenuSession = "liVisitor";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(SessionHelper.MessageSession))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "SaveSuccessMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Success, Common.Variable.Success, '" + SessionHelper.MessageSession + "');});", true);
                    SessionHelper.RemoveMessageSession();
                }
            }
        }

        #endregion


        #region Events

        protected void gvVisitor_PreRender(object sender, EventArgs e)
        {
            try
            {
                IVisitService _IVisitServiceService = new VisitService();

                Result<List<Visit>> _Result = _IVisitServiceService.GetVisitList();

                if (_Result.IsSuccess)
                {
                    gvVisitor.DataSource = _Result.Data;
                    gvVisitor.DataBind();

                    if (gvVisitor.Rows.Count > 0)
                    {
                        gvVisitor.UseAccessibleHeader = true;
                        gvVisitor.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "GetFailMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel(_Result.Message) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton _btnDelete = (LinkButton)sender;

                Guid _VisitId = new Guid(_btnDelete.CommandArgument);

                IVisitService _IVisitServiceService = new VisitService();

                Result<Boolean> _Result = _IVisitServiceService.DeleteVisitById(_VisitId, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    IHistoryService _IHistoryService = new HistoryService();
                    _IHistoryService.InsertHistory<Guid>(Convert.ToString(_VisitId), TableType.VisitMaster, OperationType.Delete, _VisitId, SessionHelper.SessionDetail.UserID);

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "DeletionSuccessMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Success, Common.Variable.Success, '" + String.Format(CommonHelper.GetLanguageLabel("DeletionSuccessMsg"), CommonHelper.GetLanguageLabel("Visitor")) + "');});", true);
                    gvVisitor_PreRender(gvVisitor, new EventArgs());
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "DeletionFailMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("Visitor")) + "');});", true);
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