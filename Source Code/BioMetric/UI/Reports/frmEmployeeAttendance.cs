using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using Microsoft.Reporting.WinForms;
using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace BioMetric.UI.Reports
{
    public partial class frmEmployeeAttendance : Form
    {
        #region Variables

        private IEmployeeService _IEmployeeService = new EmployeeService();
        private IDeviceService _IDeviceService = new DeviceService();
        private IEmployeeAttendanceDeviceService _IEmployeeAttendanceDeviceService = new EmployeeAttendanceDeviceService();

        #endregion


        #region Form Events And Constructor

        public frmEmployeeAttendance()
        {
            InitializeComponent();
        }

        private void frmEmployeeAttendance_Load(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;

            dtpFrom.MaxDate = DateTime.Now;

            DataTable _DataTable = new DataTable();
            _DataTable.Columns.Add("name");
            _DataTable.Columns.Add("number");

            for (int no = 1; no < 13; no++)
            {
                DataRow _DataRow = _DataTable.NewRow();
                _DataRow["name"] = new DateTime(2012, no, 01).ToString("MMMM");
                _DataRow["number"] = no;
                _DataTable.Rows.Add(_DataRow);
            }

            cbMonth.DataSource = _DataTable;
            cbMonth.DisplayMember = "name";
            cbMonth.ValueMember = "number";
            cbMonth.Text = DateTime.Now.ToString("MMMM");

            int _Year = DateTime.Now.Year;

            for (int no = 0; no < 5; no++)
            {
                cbYear.Items.Add(_Year - no);
            }

            cbYear.Text = Convert.ToString(DateTime.Now.Year);

            dtpTo.Enabled = false;
            rbtnDaily.Checked = true;

            FillDevice();
            LoadEmployee();

            this.Cursor = Cursors.Default;
            this.rvReport.RefreshReport();
        }

        #endregion


        #region Button Events

        private void rbtn_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnDaily.Checked)
            {
                dtpFrom.MaxDate = DateTime.Now;
                dtpFrom.Value = DateTime.UtcNow;

                dtpFrom.Location = new Point(22, 29);
                dtpTo.Visible = lblTo.Visible = cbMonth.Visible = cbYear.Visible = false;
                dtpFrom.Visible = true;
                dtpFrom.Focus();
            }
            else if (rbtnWeekly.Checked)
            {
                dtpFrom.Location = new Point(22, 29);
                dtpTo.Location = new Point(154, 29);
                dtpFrom.Visible = dtpTo.Visible = lblTo.Visible = true;
                cbMonth.Visible = cbYear.Visible = false;
                dtpFrom.Focus();
                dtpFrom.Value = DateTime.UtcNow.AddDays(-6);
                dtpFrom.MaxDate = DateTime.Now.AddDays(-6);
                dtpTo.Value = DateTime.UtcNow;
            }
            else if (rbtnMonthly.Checked)
            {
                cbMonth.Location = new Point(22, 29);
                cbYear.Location = new Point(154, 29);
                dtpFrom.Visible = dtpTo.Visible = lblTo.Visible = false;
                cbMonth.Visible = cbYear.Visible = true;
                cbMonth.Focus();
            }
        }

        private void dtpFrom_ValueChanged(object sender, EventArgs e)
        {
            if (rbtnWeekly.Checked)
            {
                dtpTo.Value = dtpFrom.Value.AddDays(6);
            }
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            try
            {
                this.Cursor = Cursors.WaitCursor;

                DateTime _FromDate = dtpFrom.Value.Date, _ToDate = dtpTo.Value.Date;

                if (rbtnMonthly.Checked)
                {
                    _FromDate = Convert.ToDateTime(cbYear.SelectedItem.ToString() + "/" + cbMonth.SelectedValue + "/01");
                    _ToDate = _FromDate.AddMonths(1).AddDays(-1);
                }
                else if (rbtnDaily.Checked)
                {
                    _ToDate = _FromDate;
                }

                Result<DataTable> _Result = _IEmployeeService.GetEmployeeAttendanceReportByEmpoyeeIdAndDate(txtEmployeeName.Text.Trim(), _FromDate, _ToDate, new Guid(Convert.ToString(cbBranchName.SelectedValue)));

                if (_Result.IsSuccess)
                {
                    rvReport.Reset();

                    rvReport.LocalReport.ReportEmbeddedResource = "BioMetric.UI.Reports.EmployeeAttendanceReport.rdlc";

                    rvReport.LocalReport.DataSources.Add(new ReportDataSource("DataSet", _Result.Data));

                    string _DateRange = _FromDate.ToString("dd") + "/" + _FromDate.ToString("MM") + "/" + _FromDate.Year + " - " + _ToDate.ToString("dd") + "/" + _ToDate.ToString("MM") + "/" + _ToDate.Year;

                    ReportParameter[] _ReportParameter = new ReportParameter[1];
                    _ReportParameter[0] = new ReportParameter("DateRange", _DateRange);
                    rvReport.LocalReport.SetParameters(_ReportParameter);

                    rvReport.RefreshReport();
                }

                this.Cursor = Cursors.Default;
            }
            catch (Exception _Exception)
            {
                this.Cursor = Cursors.Default;
                throw _Exception;
            }
        }

        private void btnExist_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        #endregion


        #region Private Methods

        private void FillDevice()
        {
            Result<DataTable> _Result = _IDeviceService.GetAllDeviceName();

            if (_Result.IsSuccess)
            {
                //DataRow _DataRow = _Result.Data.NewRow();
                //_DataRow[0] = 0;
                //_DataRow[1] = GlobalHelper.GetLanguageLabel("Select");

                //_Result.Data.Rows.InsertAt(_DataRow, 0);
                cbBranchName.DataSource = _Result.Data;
                cbBranchName.DisplayMember = "Device";
                cbBranchName.ValueMember = "DeviceID";
            }
        }

        private void LoadEmployee()
        {
            Result<DataTable> _Result = _IEmployeeService.GetAllEmployeeFirstName();

            if (_Result.IsSuccess)
            {
                string[] _Employee = _Result.Data.AsEnumerable().Select(q => q.Field<string>("FirstName")).ToArray<string>();
                AutoCompleteStringCollection autoComplete = new AutoCompleteStringCollection();
                autoComplete.AddRange(_Employee);
                txtEmployeeName.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
                txtEmployeeName.AutoCompleteSource = AutoCompleteSource.CustomSource;
                txtEmployeeName.AutoCompleteCustomSource = autoComplete;
            }
        }

        #endregion
    }
}
