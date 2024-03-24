using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Helpers
{
    public static class EmailHelper
    {
        #region Variables

        private readonly static log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #endregion


        #region Methods

        public static bool SendMail(string p_Subject, string p_Body, List<string> p_ToMailIds)
        {
            bool flag = false;
            try
            {
                MailMessage mail = new MailMessage();
                foreach (string toMailId in p_ToMailIds)
                {
                    if (!string.IsNullOrEmpty(toMailId))
                    {
                        mail.To.Add(toMailId);
                    }
                }

                ICompanyService _ICompanyService = new CompanyService();

                 Result<Company> _Result = _ICompanyService.GetCompany();

                 if (_Result.IsSuccess)
                 {
                     mail.From = new MailAddress(_Result.Data.FromEmailId);

                     mail.Subject = p_Subject;
                     string Body = p_Body;
                     mail.Body = Body;
                     mail.IsBodyHtml = true;
                     SmtpClient smtp = new SmtpClient();
                     smtp.Host = _Result.Data.SMTPHost;
                     smtp.Port = _Result.Data.SMTPPort;
                     smtp.UseDefaultCredentials = false;
                     smtp.Credentials = new System.Net.NetworkCredential(_Result.Data.UserEmailId, _Result.Data.UserEmailPassword);
                     smtp.EnableSsl = _Result.Data.IsEnableSSL;
                     smtp.Send(mail);
                 }
              
                flag = true;
            }
            catch (Exception _Exception)
            {
                flag = false;
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
            }
            return flag;
        }

        #endregion
    }
}