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
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Globalization;
using ERP.Common;
using System.Resources;
using System.Threading;

namespace ERP.Modules
{
    public partial class Main1 : System.Web.UI.Page
    {
        #region Variable

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        IHolidayService _IHolidayService = new HolidayService();
        IEmployeePaidSalaryService _IEmployeePaidSalaryService = new EmployeePaidSalaryService();
        IEmployeeLeaveCategoryService _IEmployeeLeaveCategoryService = new EmployeeLeaveCategoryService();
        IEmployeeService _IEmployeeService = new EmployeeService();

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail == null)
            {
                Response.Redirect("~/Modules/Login.aspx", false);
            }
            SessionHelper.SelectMenuSession = "liDashboard";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(SessionHelper.MessageSession))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "SaveSuccessMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Success, Common.Variable.Success, '" + SessionHelper.MessageSession + "');});", true);
                    SessionHelper.RemoveMessageSession();
                }

                if (SessionHelper.SessionDetail != null)
                {
                    if (SessionHelper.SessionDetail.RoleId == new Guid(GlobalHelper.GetEnumDescription(Role.Employee)))
                    {
                        divEmployee.Visible = true;
                        divAdmin.Visible = false;
                        FillEmployeeDashBoardDetails();
                    }
                    else
                    {
                        divEmployee.Visible = false;
                        divAdmin.Visible = true;
                        FillAdminDashBoardDetails();
                    }

                    lblEmployeeName.Text = SessionHelper.SessionDetail.FullName;
                }

                Result<List<Holiday>> _HolidayResult = _IHolidayService.GetHolidayList();

                if (_HolidayResult.IsSuccess)
                {
                    gvHoliday.DataSource = _HolidayResult.Data.Where(a => a.StartDate >= DateTime.Now).OrderBy(a => a.StartDate).Take(10);
                    gvHoliday.DataBind();

                    gvAdminHoliday.DataSource = _HolidayResult.Data.Where(a => a.StartDate >= DateTime.Now).OrderBy(a => a.StartDate).Take(10);
                    gvAdminHoliday.DataBind();
                }

                Result<List<Employee>> _BirthdayResult = _IEmployeeService.EmployeeUpcomingBirthday();

                if (_BirthdayResult.IsSuccess)
                {
                    gvBirthday.DataSource = _BirthdayResult.Data;
                    gvBirthday.DataBind();

                    gvAdminBirthday.DataSource = _BirthdayResult.Data;
                    gvAdminBirthday.DataBind();
                }

                FillFinancialYear();
                FillLanguage();
            }
        }

        #endregion


        #region Events

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            CalendarDay day = (CalendarDay)e.Day;

            if (ViewState["WorkingDaysResult"] == null)
            {
                List<string> _WorkingDaysResult = _IEmployeeService.GetEmployeeById(SessionHelper.SessionDetail.EmployeeId).Data.WorkingDays.ToList();

                if (_WorkingDaysResult != null)
                {
                    ViewState["WorkingDaysResult"] = _WorkingDaysResult;
                }
            }
            List<string> _ListOfWeeklyOff = (List<string>)ViewState["WorkingDaysResult"];
            bool _WeeklyOff = _ListOfWeeklyOff.Contains(e.Day.Date.DayOfWeek.ToString());
            if (!_WeeklyOff)
            {
                e.Cell.ForeColor = System.Drawing.Color.Blue;
            }
            else
            {
                if (ViewState["HolidayResult"] == null)
                {
                    Result<List<Holiday>> _HolidayResult = _IHolidayService.GetHolidayList();

                    if (_HolidayResult.IsSuccess)
                    {
                        ViewState["HolidayResult"] = _HolidayResult.Data;
                    }
                }

                List<Holiday> _ListOfHoliDay = (List<Holiday>)ViewState["HolidayResult"];
                int _Holiday = _ListOfHoliDay.Where(d => d.StartDate <= day.Date && d.EndDate >= day.Date).Count();

                if (_Holiday > 0)
                {
                    e.Cell.ForeColor = System.Drawing.Color.Cyan;
                }
                else
                {
                    if (ViewState["LeaveResult"] == null)
                    {
                        Result<List<EmployeeLeaveCategorys>> _LeaveResult = _IEmployeeLeaveCategoryService.GetEmployeeLeaveCategoryListByEmployeeId(SessionHelper.SessionDetail.EmployeeId);

                        if (_LeaveResult.IsSuccess && _LeaveResult.Data != null)
                        {
                            ViewState["LeaveResult"] = _LeaveResult.Data;
                        }
                    }
                    List<EmployeeLeaveCategorys> _ListOfLeave = (List<EmployeeLeaveCategorys>)ViewState["LeaveResult"];
                    int _Leave = _ListOfLeave.Where(l => l.StartDate <= day.Date && l.EndDate >= day.Date).Count();

                    if (_Leave > 0)
                    {
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            try
            {
                SessionHelper.SessionDetail.FinancialYearId = new Guid(ddlFinancialYear.SelectedValue);
                SessionHelper.CurrentUICulture = Convert.ToInt32(ddlLanguage.SelectedValue);
                
                Server.Transfer(Request.Path);
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        #endregion


        #region Methods

        private void FillEmployeeDashBoardDetails()
        {
            Result<List<EmployeePaidSalarys>> _Result = _IEmployeePaidSalaryService.GetLeaveOpeningDetailsByFinancialYearId(SessionHelper.SessionDetail.FinancialYearId, SessionHelper.SessionDetail.EmployeeId);

            if (_Result.IsSuccess && _Result.Data != null)
            {
                lblTotalLeave.Text = _Result.Data.FirstOrDefault().TotalAllowLeave.ToString();
                lblUsedLeave.Text = _Result.Data.FirstOrDefault().TotalUseLeave.ToString();
                lblRemainingLeave.Text = _Result.Data.FirstOrDefault().RemainingLeave.ToString();
            }

            Result<List<Holiday>> _HolidayResult = _IHolidayService.GetHolidayList();

            if (_HolidayResult.IsSuccess)
            {
                gvHoliday.DataSource = _HolidayResult.Data.Where(a => a.StartDate >= DateTime.Now).OrderBy(a => a.StartDate).Take(10);
                gvHoliday.DataBind();
            }

            ILookupService _ILookupService = new LookupService();

            Result<List<Dashboard>> _PaidSalaryResult = _ILookupService.GetSalaryChartDetailsByEmployeeId(SessionHelper.SessionDetail.EmployeeId, SessionHelper.SessionDetail.FinancialYearId);

            if (_PaidSalaryResult.IsSuccess)
            {
                if (_PaidSalaryResult.Data != null)
                {
                    ChartSalary.DataSource = _PaidSalaryResult.Data;
                    ChartSalary.Series["SeriesTotal"].XValueMember = "Month";
                    ChartSalary.Series["SeriesTotal"].YValueMembers = "PaidTotalSalary";
                    ChartSalary.DataBind();
                }
            }

            // Attendance Chart

            Result<List<EmployeePaidSalarys>> _ResultAttendance = _IEmployeePaidSalaryService.GetAttendanceChartByEmployeeID(SessionHelper.SessionDetail.EmployeeId, SessionHelper.SessionDetail.FinancialYearId);

            if (_ResultAttendance.IsSuccess)
            {
                if (_ResultAttendance.Data != null)
                {
                    _ResultAttendance.Data.ForEach(e => e.Month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(e.MonthNo));
                    ChartAttendance.DataSource = _ResultAttendance.Data;

                    ChartAttendance.Series["SeriesTotalDays"].XValueMember = "Month";

                    ChartAttendance.Series["SeriesTotalDays"].YValueMembers = "TotalDays";
                    ChartAttendance.Series["SeriesPresentDays"].YValueMembers = "TotalPresentDays";
                    ChartAttendance.Series["SeriesWeekluOff"].YValueMembers = "WeeklyOff";
                    ChartAttendance.Series["SeriesHolidays"].YValueMembers = "TotalHolidays";
                    ChartAttendance.Series["SeriesTotalUseLeave"].YValueMembers = "TotalUseLeave";

                    ChartAttendance.DataBind();
                }
            }
        }

        private void FillAdminDashBoardDetails()
        {
            Result<DashBoard> _Result = _IEmployeeService.GetAdminDashBoard();

            if (_Result.IsSuccess && _Result.Data != null)
            {
                lblTotalCurrentEmployee.Text = _Result.Data.TotalCurrentEmployee.ToString();
                lblTotalResignEmployee.Text = _Result.Data.TotalResignEmployee.ToString();
                lblTotalEmployee.Text = _Result.Data.TotalEmployee.ToString();
            }


        }

        private void FillFinancialYear()
        {
            IFinancialYearService _IFinancialYearService = new FinancialYearService();
            Result<List<FinancialYear>> _Result = _IFinancialYearService.GetFinancialYearList();

            if (_Result.IsSuccess)
            {
                ddlFinancialYear.DataTextField = "FinancialMonthText";
                ddlFinancialYear.DataValueField = "FinancialYearId";
                ddlFinancialYear.DataSource = _Result.Data;
                ddlFinancialYear.DataBind();

                if (_Result.Data != null && _Result.Data.Count() > 0 && SessionHelper.SessionDetail != null)
                {
                    ddlFinancialYear.SelectedValue = Convert.ToString(SessionHelper.SessionDetail.FinancialYearId);
                }
            }
        }

        private void FillLanguage()
        {
            List<ListItem> _ListOfItem = new List<ListItem>();

            _ListOfItem.Add(new ListItem() { Text = "English", Value = "1" });
            _ListOfItem.Add(new ListItem() { Text = "Arabic", Value = "2" });

            ddlLanguage.DataTextField = "Text";
            ddlLanguage.DataValueField = "Value";
            ddlLanguage.DataSource = _ListOfItem;
            ddlLanguage.DataBind();

            ddlLanguage.SelectedValue = Convert.ToString(SessionHelper.CurrentUICulture);
        }

        #endregion
    }
}