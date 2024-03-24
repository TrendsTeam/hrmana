using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;

namespace ERP.Helpers
{
    public static class CommonHelper
    {
        public static List<ListItem> GetFinancialMonthList()
        {
            List<ListItem> _ListOfMonth = new List<ListItem>();

            IFinancialYearService _IFinancialYearService = new FinancialYearService();

            Result<FinancialYear> _ResultFYear = _IFinancialYearService.GetFinancialYearById(SessionHelper.SessionDetail.FinancialYearId);

            if (_ResultFYear.IsSuccess)
            {
                int _FinancialYear = _ResultFYear.Data.Year;
                int _no = 0;

                bool _Flag = true;
                for (int no = _ResultFYear.Data.StartMonth; no < 13; no++)
                {
                    _no = _no + 1;

                    _ListOfMonth.Add(new ListItem() { Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(no) + " " + _FinancialYear, Value = Convert.ToString(no) + "_" + _FinancialYear });

                    if (no == DateTime.Now.Month && _FinancialYear == DateTime.Now.Year)
                    {
                        _Flag = false;
                        break;
                    }
                }

                if (_Flag && _no < 12)
                {
                    for (int no = 1; no <= _ResultFYear.Data.EndMonth; no++)
                    {
                        _ListOfMonth.Add(new ListItem() { Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(no) + " " + (_FinancialYear + 1), Value = Convert.ToString(no) + "_" + (_FinancialYear + 1) });
                        if (no == DateTime.Now.Month && _FinancialYear + 1 == DateTime.Now.Year)
                        {
                            break;
                        }
                    }
                }
            }

            return _ListOfMonth;
        }

        public static string GetLanguageLabel(string p_Key)
        {
            string _Value = p_Key;

            try
            {
                string _ResourceName = "ERP.App_GlobalResources.GlobalStrings";

                ResourceManager _ResourceManager = new ResourceManager(_ResourceName, Assembly.GetExecutingAssembly());

                if (_ResourceManager != null)
                {
                    _Value = _ResourceManager.GetString(p_Key, Thread.CurrentThread.CurrentUICulture);
                }
            }
            catch
            {
                _Value = p_Key;
            }

            return _Value;
        }
    }
}