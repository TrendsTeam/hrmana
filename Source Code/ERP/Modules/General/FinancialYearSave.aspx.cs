using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Helpers;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules.General
{
    public partial class FinancialYearSave : System.Web.UI.Page
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

            SessionHelper.SelectMenuSession = "liFinancialYear";

            if (!IsPostBack)
            {
                FillYear();
            }
        }

        #endregion


        #region Events

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                FinancialYear _FinancialYear = new FinancialYear();

                _FinancialYear.Year = Convert.ToInt32(ddlYear.SelectedValue);
                _FinancialYear.FinancialYearText = lblFinancialYear.Text;
                _FinancialYear.StartMonth = Convert.ToInt32(ddlFinancialMonth.SelectedValue);
                _FinancialYear.EndMonth = _FinancialYear.StartMonth - 1;

                if (_FinancialYear.EndMonth == 0)
                {
                    _FinancialYear.EndMonth = 12;
                }

                IFinancialYearService _IFinancialYearService = new FinancialYearService();

                Result<Boolean> _Result = _IFinancialYearService.SaveFinancialYear(_FinancialYear, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    SessionHelper.MessageSession = String.Format(CommonHelper.GetLanguageLabel("SaveSuccessMsg"), CommonHelper.GetLanguageLabel("FinancialYear"));

                    IHistoryService _IHistoryService = new HistoryService();

                    _IHistoryService.InsertHistory<FinancialYear>(_Result.Id, TableType.FinancialYearMaster, OperationType.Insert, _FinancialYear, SessionHelper.SessionDetail.UserID);

                    Response.Redirect("~/Modules/General/FinancialYearList.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AlreadyExistsMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Warning, Common.Variable.Warning, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("FinancialYear")) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlYear.SelectedIndex > 0)
            {
                int _NextYear = Convert.ToInt32(ddlYear.SelectedValue) + 1;
                lblFinancialYear.Text = ddlYear.SelectedValue + " - " + _NextYear.ToString();
                FillMonth(Convert.ToInt32(ddlYear.SelectedValue));
            }
            else
            {
                lblFinancialYear.Text = string.Empty;
                ddlFinancialMonth.Items.Clear();
            }
        }

        #endregion


        #region Methods

        private void FillYear()
        {
            ddlYear.Items.Clear();

            int _Year = DateTime.Now.Year;

            ddlYear.Items.Add(new ListItem(CommonHelper.GetLanguageLabel("SelectYear"), ""));
            ddlYear.Items.Add(new ListItem((_Year - 1).ToString(), (_Year - 1).ToString()));
            ddlYear.Items.Add(new ListItem(_Year.ToString(), _Year.ToString()));
        }

        private void FillMonth(int p_Year)
        {
            ddlFinancialMonth.Items.Clear();

            ddlFinancialMonth.Items.Insert(0, new ListItem() { Text = CommonHelper.GetLanguageLabel("Select"), Value = "" });

            for (int no = 1; no < 13; no++)
            {
                string _MonthText = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(no) + " " + p_Year;

                int _ToMonth = no - 1;
                if (_ToMonth == 0)
                {
                    _MonthText = _MonthText + " - " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(12) + " " + p_Year;
                }
                else
                {
                    _MonthText = _MonthText + " - " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(_ToMonth) + " " + (p_Year + 1);
                }

                ddlFinancialMonth.Items.Insert(no, new ListItem() { Text = _MonthText, Value = Convert.ToString(no) });
            }
        }

        #endregion

    }
}