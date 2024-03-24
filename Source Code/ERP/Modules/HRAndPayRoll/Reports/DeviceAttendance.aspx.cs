using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Helpers;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules.HRAndPayRoll.Reports
{
    public partial class DeviceAttendance : System.Web.UI.Page
    {
        #region Variables

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        IEmployeeAttendanceService _IEmployeeAttendanceService = new EmployeeAttendanceService();
        ILookupService _ILookupService = new LookupService();

        #endregion

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail == null)
            {
                Response.Redirect("~/Modules/Login.aspx", false);
            }

            SessionHelper.SelectMenuSession = "liAttendanceDevice_liHR_liHRReports";

            if (!IsPostBack)
            {
                FillMonth();
                FillEmployee();
            }
        }


        #endregion

        #region Events

        protected void btnReport_Click(object sender, EventArgs e)
        {
            FillGrid();
        }

        #endregion

        #region Methods

        private void FillMonth()
        {
            ddlMonth.Items.Insert(0, new ListItem() { Text = CommonHelper.GetLanguageLabel("Select"), Value = "" });
            ddlMonth.Items.AddRange(CommonHelper.GetFinancialMonthList().ToArray());
        }

        private void FillGrid()
        {
            try
            {
                if (ddlMonth.SelectedIndex > 0 && ddlEmployee.SelectedIndex > 0)
                {
                    if (!string.IsNullOrEmpty(ddlMonth.SelectedValue))
                    {
                        Guid _EmployeeId = new Guid(ddlEmployee.SelectedValue);
                        int _Month = DateTime.Now.Month;
                        int _Year = DateTime.Now.Year;

                        string[] _SplitDate = ddlMonth.SelectedValue.Split('_');

                        if (_SplitDate.Length > 1)
                        {
                            _Month = Convert.ToInt32(_SplitDate[0]);
                            _Year = Convert.ToInt32(_SplitDate[1]);
                        }

                        DateTime _StartDate = new DateTime(_Year, _Month, 1);
                        DateTime _EndDate = _StartDate.AddMonths(1).AddDays(-1);

                        if (_EndDate.Date > DateTime.Now.Date)
                        {
                            _EndDate = DateTime.Now.Date;
                        }

                        IEmployeeAttendanceDeviceService _IEmployeeAttendanceDeviceService = new EmployeeAttendanceDeviceService();
                        List<EmployeeAttendanceResult> _ListOfEmployeeAttendanceResult = new List<EmployeeAttendanceResult>();

                        Result<List<EmployeeAttendanceDevices>> _Result = _IEmployeeAttendanceDeviceService.GetEmployeeAttendanceDeviceByEmployeeId(_EmployeeId, _StartDate, _EndDate);
                        Result<List<EmployeeAttendances>> _ResultManual = _IEmployeeAttendanceService.GetEmployeeAttendanceByEmployeeId(_EmployeeId, _StartDate, _EndDate);

                        if (_Result.IsSuccess)
                        {
                            EmployeeAttendanceResult _EmployeeAttendanceResult;
                            divcolor.Visible = true;

                            for (DateTime date = _StartDate; date <= _EndDate; date = date.AddDays(1.0))
                            {
                                _EmployeeAttendanceResult = new EmployeeAttendanceResult();

                                _EmployeeAttendanceResult.AttendanceDateValue = Convert.ToString(date.Day + "/" + date.Month + "/" + date.Year);
                                _EmployeeAttendanceResult.Attendances = String.Join(" | ", _Result.Data.Where(r => r.AttendanceDate == date).OrderBy(r => r.AttendanceDateTime).Select(r => r.PunchTime));
                                _EmployeeAttendanceResult.Type = _EmployeeAttendanceResult.Attendances == string.Empty ? _ResultManual.Data.Where(a => a.AttendanceDate == date).Select(a => a.AttendanceText).FirstOrDefault() : Convert.ToString(AttendanceType.Present);
                                _EmployeeAttendanceResult.AttendanceType = _EmployeeAttendanceResult.Attendances == string.Empty ? _ResultManual.Data.Where(a => a.AttendanceDate == date).Select(a => a.AttendanceType).FirstOrDefault() : Convert.ToInt32(AttendanceType.Present);
                                _EmployeeAttendanceResult.Description = _EmployeeAttendanceResult.AttendanceType == Convert.ToInt32(AttendanceType.Leave) || _EmployeeAttendanceResult.AttendanceType == Convert.ToInt32(AttendanceType.Holiday) ? _ResultManual.Data.Where(a => a.AttendanceDate == date).Select(a => a.Description).FirstOrDefault() : "";

                                _ListOfEmployeeAttendanceResult.Add(_EmployeeAttendanceResult);
                            }

                            gvDeviceAttendance.DataSource = _ListOfEmployeeAttendanceResult;
                            gvDeviceAttendance.DataBind();
                        }
                    }
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        protected string setClass(int AttendanceType)
        {
            string classToApply = "blueFont";

            if (AttendanceType == Convert.ToInt32(Common.AttendanceType.Leave))
            {
                classToApply = "redFont";
            }
            else if (AttendanceType == Convert.ToInt32(Common.AttendanceType.Present))
            {
                classToApply = "greenFont";
            }
            else if (AttendanceType == Convert.ToInt32(Common.AttendanceType.Holiday))
            {
                classToApply = "cyanFont";
            }

            return classToApply;
        }

        private void FillEmployee()
        {
            Result<List<Item>> _Result = _ILookupService.GetAllActiveEmployee();

            if (_Result.IsSuccess)
            {
                ddlEmployee.DataTextField = "Text";
                ddlEmployee.DataValueField = "Id";
                ddlEmployee.DataSource = _Result.Data;
                ddlEmployee.DataBind();

                ddlEmployee.Items.Insert(0, new ListItem() { Text = CommonHelper.GetLanguageLabel("Select"), Value = "" });
            }
        }

        #endregion
    }
}