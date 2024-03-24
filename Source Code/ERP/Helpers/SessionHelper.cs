using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace ERP.Helpers
{
    public static class SessionHelper
    {
        public static SessionDetail SessionDetail
        {
            get
            {
                if (HttpContext.Current.Session["SessionDetail"] == null)
                {
                    return null;
                }
                else
                {
                    return (SessionDetail)HttpContext.Current.Session["SessionDetail"];
                }
            }
            set
            {
                HttpContext.Current.Session["SessionDetail"] = value;
            }
        }

        public static void RemoveSessionDetail()
        {
            HttpContext.Current.Session.Remove("SessionDetail");
        }

        public static string MessageSession
        {
            get
            {
                if (HttpContext.Current.Session["MessageSession"] == null)
                {
                    return string.Empty;
                }
                else
                {
                    return Convert.ToString(HttpContext.Current.Session["MessageSession"]);
                }
            }
            set
            {
                HttpContext.Current.Session["MessageSession"] = value;
            }
        }

        public static void RemoveMessageSession()
        {
            HttpContext.Current.Session.Remove("MessageSession");
        }

        public static string SelectMenuSession
        {
            get
            {
                if (HttpContext.Current.Session["SelectMenuSession"] == null)
                {
                    return string.Empty;
                }
                else
                {
                    return Convert.ToString(HttpContext.Current.Session["SelectMenuSession"]);
                }
            }
            set
            {
                HttpContext.Current.Session["SelectMenuSession"] = value;
            }
        }

        public static string CompanyName
        {
            get
            {
                if (HttpContext.Current.Session["CompanyName"] == null)
                {
                    string _Company = string.Empty;

                    ICompanyService _ICompanyService = new CompanyService();

                    Result<Company> _Result = _ICompanyService.GetCompany();

                    if (_Result.IsSuccess)
                    {
                        _Company = _Result.Data.CompanyName;
                    }

                    if (string.IsNullOrEmpty(_Company))
                    {
                        _Company = "HRM";
                    }

                    SessionHelper.CompanyName = _Company;

                    return _Company;
                }
                else
                {
                    return Convert.ToString(HttpContext.Current.Session["CompanyName"]);
                }
            }
            set
            {
                HttpContext.Current.Session["CompanyName"] = value;
            }
        }

        //public static bool CheckPermissionByRole(List<int> p_Roles)
        //{
        //    if (SessionHelper.SessionDetail != null)
        //    {
        //        int _Count = p_Roles.Where(r => r == Convert.ToInt32(SessionHelper.SessionDetail.RoleId)).Count();

        //        if (_Count > 0)
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        public static int CurrentUICulture
        {
            get
            {
                int Value = Convert.ToInt32(CultureType.English);
                if (HttpContext.Current.Session["CurrentUICulture"] != null)
                {
                    Value = (Int32)HttpContext.Current.Session["CurrentUICulture"];
                }
                //SetCulture();
                return Value;
            }
            set
            {
                HttpContext.Current.Session["CurrentUICulture"] = value;
                SetCulture();
            }
        }

        public static void SetCulture()
        {
            try
            {
                if (HttpContext.Current.Session["CurrentUICulture"] != null)
                {
                    int _CultureId = (Int32)HttpContext.Current.Session["CurrentUICulture"];

                    if (_CultureId == Convert.ToInt32(CultureType.Arabic))
                    {
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo(GlobalHelper.GetEnumDescription(CultureType.Arabic));
                    }
                    else
                    {
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo(GlobalHelper.GetEnumDescription(CultureType.English));
                    }

                    Thread.CurrentThread.CurrentCulture = Thread.CurrentThread.CurrentUICulture;
                }
            }
            catch 
            {
               
            }
           
        }

    }
}