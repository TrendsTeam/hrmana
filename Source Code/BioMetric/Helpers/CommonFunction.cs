using ERP.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BioMetric.Helpers
{
    public static class CommonFunction
    {
        public static void GridPagging(DataTable p_DataTable, int p_TotalRecord, DataGridView p_GridView, int p_PageNo, Label p_lblRowNo, ComboBox p_cbPage, Button p_btnFrist, Button p_btnPrevious, Button p_btnLast, Button p_btnNext)
        {
            int _PageSize = 10, _TotalPage = 0, _SelectRowNo = 1;

            DataTable _DataTable = p_DataTable.Clone();

            int _StartIndex = 0;
            int _EndIndex = _PageSize;

            // Pagging section
            if (p_PageNo > 1)
            {
                _StartIndex = (p_PageNo - 1) * _PageSize;
                _EndIndex = _StartIndex + _PageSize;


                //p_DataTable = _DataView.Skip(_PrevPageLimit).Take(_PageSize).ToList();
                _SelectRowNo = _StartIndex + 1;
            }

            _SelectRowNo = _StartIndex + 1;

            if (_EndIndex > p_TotalRecord)
            {
                _EndIndex = p_TotalRecord;
            }

            for (int no = _StartIndex; no < _EndIndex; no++)
            {
                DataRow newRow = _DataTable.NewRow();
                // GetNewRow will get the datarow ata a particular index from datasource.
                GetNewRow(ref newRow, p_DataTable.Rows[no], p_DataTable);
                _DataTable.Rows.Add(newRow);
            }

            // Fill grid
            p_GridView.DataSource = _DataTable;

            // Calculate total page
            _TotalPage = p_TotalRecord / _PageSize;

            if (p_TotalRecord % _PageSize > 0)
            {
                _TotalPage += 1;
            }

            SetSelectRowNo(_SelectRowNo, p_TotalRecord, p_lblRowNo);

            // Fill page combobox
            if (p_cbPage.Items.Count == 0)
            {
                p_cbPage.Items.AddRange(Enumerable.Range(1, _TotalPage).Cast<object>().ToArray());
                p_cbPage.Text = "1";
            }
            else if (_TotalPage > p_cbPage.Items.Count)
            {
                p_cbPage.Items.Clear();
                p_cbPage.Items.AddRange(Enumerable.Range(1, _TotalPage).Cast<object>().ToArray());
                p_cbPage.Text = "1";
            }
            else if (_TotalPage == 0)
            {
                p_cbPage.Items.Clear();
            }
            else if (_TotalPage < p_cbPage.Items.Count)
            {
                p_cbPage.Items.Clear();
                p_cbPage.Items.AddRange(Enumerable.Range(1, _TotalPage).Cast<object>().ToArray());
                p_cbPage.Text = "1";
            }

            //Set button enable or disable
            p_btnFrist.Enabled = false;
            p_btnPrevious.Enabled = false;
            p_btnLast.Enabled = false;
            p_btnNext.Enabled = false;

            if (p_DataTable != null)
            {
                if (p_DataTable.Rows.Count != 0)
                {
                    if (p_PageNo == 1)
                    {
                        if (p_PageNo != _TotalPage)
                        {
                            p_btnNext.Enabled = true;
                            p_btnLast.Enabled = true;
                        }
                    }
                    else if (p_PageNo == _TotalPage)
                    {
                        p_btnFrist.Enabled = true;
                        p_btnPrevious.Enabled = true;
                    }
                    else
                    {
                        p_btnFrist.Enabled = true;
                        p_btnPrevious.Enabled = true;
                        p_btnNext.Enabled = true;
                        p_btnLast.Enabled = true;
                    }
                }
            }
        }

        private static void GetNewRow(ref DataRow newRow, DataRow source, DataTable p_DataTable)
        {
            foreach (DataColumn _DataColumn in p_DataTable.Columns)
            {
                newRow[_DataColumn.ColumnName] = source[_DataColumn.ColumnName];
            }
        }

        public static void SetSelectRowNo(int p_RowNo, int p_TotalRow, Label p_lblRowNo)
        {
            if (p_TotalRow > 0)
            {
                p_lblRowNo.Visible = true;
                p_lblRowNo.Text = " Record No. " + p_RowNo + " of " + p_TotalRow;
            }
            else
            {
                p_lblRowNo.Text = Messages.NoRecordMsg;
                p_lblRowNo.Visible = true;
            }
        }

        public static void Connect(string p_IPAddress)
        {
            try
            {
                Ping _Ping = new Ping();
                _Ping.PingCompleted += (sender, e) =>
                {
                    if (e.Reply.Status == IPStatus.Success)
                    {
                    }

                };
                _Ping.SendAsync(p_IPAddress, 3000, null);
            }
            catch { }
        }

    }
}
