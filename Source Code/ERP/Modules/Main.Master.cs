using ERP.Common;
using ERP.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail != null)
            {
                if (SessionHelper.SessionDetail.RoleId == new Guid(GlobalHelper.GetEnumDescription(Role.Employee)))
                {
                    liHR.Visible = liGeneralSettings.Visible = liFinancialYear.Visible =  liVisitor.Visible = false;
                    liProfile.Visible = liUserDetail.Visible = liAttendance.Visible = liLeaveDetails.Visible = liSalarySlip.Visible = liLeaveApplication.Visible = liDeviceAttendance.Visible = true;
                }
                else
                {
                    liHR.Visible = liGeneralSettings.Visible = liFinancialYear.Visible =  liVisitor.Visible = true;
                    liProfile.Visible = liUserDetail.Visible = liAttendance.Visible = liLeaveDetails.Visible = liSalarySlip.Visible = liLeaveApplication.Visible = liDeviceAttendance.Visible = false;
                }

                lblUserName.InnerText = SessionHelper.SessionDetail.FullName;

                string _Path = System.Configuration.ConfigurationManager.AppSettings["ImagePath"] + UploadFileFolderName.EmployeePhoto + "/";
                string _FilePath = !string.IsNullOrEmpty(SessionHelper.SessionDetail.PhotoName) && File.Exists(Server.MapPath(Path.Combine(_Path, SessionHelper.SessionDetail.PhotoName))) ? Path.Combine(_Path, SessionHelper.SessionDetail.PhotoName) : "~/Images/DefaultUser.png";
                imgUserProfile.Src = _FilePath;

                string _LogoPath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"] + UploadFileFolderName.CompanyLogo + "/";
                string _LogoFilePath = !string.IsNullOrEmpty(SessionHelper.SessionDetail.CompanyLogo) && File.Exists(Server.MapPath(Path.Combine(_LogoPath, SessionHelper.SessionDetail.CompanyLogo))) ? Path.Combine(_LogoPath, SessionHelper.SessionDetail.CompanyLogo) : "~/Images/Logo.png";
                imgCompanyLogo.Src = _LogoFilePath;

                string _SelectMenu = "liDashboard";
                if (SessionHelper.SelectMenuSession != null)
                {
                    _SelectMenu = SessionHelper.SelectMenuSession;

                    Guid _RoleId = new Guid(GlobalHelper.GetEnumDescription(Role.Administrator));
                    if (SessionHelper.SessionDetail.RoleId == _RoleId)
                    {
                        imgUserProfile.Src = _LogoFilePath;
                    }
                }

                ScriptManager.RegisterStartupScript(this, typeof(Page), "SelectMenu", "$(document).ready(function() {Common.SelectCurrentMenu('" + _SelectMenu + "');});", true);
            }
        }
    }
}