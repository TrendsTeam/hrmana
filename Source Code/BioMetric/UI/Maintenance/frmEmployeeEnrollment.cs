using BioMetric.Helpers;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using zkemkeeper;

namespace BioMetric.UI.Maintenance
{
    public partial class frmEmployeeEnrollment : Form
    {
        #region Variables

        private IEmployeeService _IEmployeeService = new EmployeeService();
        private IDeviceService _IDeviceService = new DeviceService();
        private IEmployeeDeviceMapService _IEmployeeDeviceMapService = new EmployeeDeviceMapService();
        private DataTable _EmployeeDataTable = null, _EmployeeSearchDataTable = null;
        private int _PageNo = 1, _TotalRecords = 0;
        private bool _FirstLoad = true;
        private CZKEMClass CtrlBioComm = new CZKEMClass();
        public string ErrorMessage = "";

        #endregion


        #region Page events and constructor

        public frmEmployeeEnrollment()
        {
            InitializeComponent();
        }

        private void frmEmployeeEnrollment_Load(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;

            txtSearch.Select();
            FillEmployeeDataTable();

            gvEmployeeEnrollment.AutoGenerateColumns = false;

            FillGrid();

            _FirstLoad = false;

            this.Cursor = Cursors.Default;
        }

        #endregion


        #region Button Events

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FillGrid();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cbPages_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!_FirstLoad)
            {
                if (cbPages.SelectedIndex >= 0)
                {
                    _PageNo = Convert.ToInt32(cbPages.Text);
                }
                FillGrid();
            }
        }

        private void btnFirst_Click(object sender, EventArgs e)
        {
            _PageNo = 1;
            cbPages.Text = _PageNo.ToString();
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            if (_PageNo > 1)
            {
                _PageNo--;
                cbPages.Text = _PageNo.ToString();
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            _PageNo++;
            cbPages.Text = _PageNo.ToString();
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            _PageNo = cbPages.Items.Count;
            cbPages.Text = _PageNo.ToString();
        }
       

        #endregion


        #region Private Methods

        private void FillEmployeeDataTable()
        {
            _EmployeeDataTable = null;

            Result<DataTable> _Result = _IEmployeeService.GetAllEmployees();

            if (_Result.IsSuccess)
            {
                _EmployeeDataTable = _Result.Data;
            }
        }

        private void FillGrid()
        {
            this.Cursor = Cursors.WaitCursor;

            gvEmployeeEnrollment.DataSource = null;
            gvEmployeeEnrollment.Rows.Clear();

            DataTable _DataTable = _EmployeeDataTable;

            if (_EmployeeDataTable != null)
            {
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    string _Search = txtSearch.Text.Trim().ToLower();

                    EnumerableRowCollection<DataRow> _Query = from s in _EmployeeDataTable.AsEnumerable()
                                                              where s.Field<string>("FullName").ToLower().Contains(_Search)
                                                             || s.Field<string>("Email").ToLower().Contains(_Search) || s.Field<string>("MobileNo").ToLower().Contains(_Search)
                                                              select s;

                    _DataTable = _Query.AsDataView().ToTable();
                }

                if (_DataTable != null)
                {
                    _TotalRecords = _DataTable.Rows.Count;
                }

                CommonFunction.GridPagging(_DataTable, _TotalRecords, gvEmployeeEnrollment, this._PageNo, lblSelectRow, cbPages, btnFirst, btnPrevious, btnLast, btnNext);
            }

            _EmployeeSearchDataTable = _DataTable;

            this.Cursor = Cursors.Default;
        }

        #endregion
    }
}
