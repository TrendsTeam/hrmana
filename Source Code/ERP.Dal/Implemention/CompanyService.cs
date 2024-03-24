using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class CompanyService : ICompanyService
    {
        public Result<Company> GetCompany()
        {
            Result<Company> _Result = new Result<Company>();
            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from c in dbContext.CompanyMasters
                                 where c.IsActive == true
                                 select new Company
                                 {
                                     CompanyID = c.CompanyID,
                                     CompanyName = c.CompanyName,
                                     CompanyLogo = c.CompanyLogo,
                                     EmailAddress = c.EmailAddress,
                                     CountryId = c.CountryId ?? Guid.Empty,
                                     StateId = c.StateId ?? Guid.Empty,
                                     City = c.City,
                                     Address = c.Address,
                                     MobileNo = c.MobileNo,
                                     PhoneNo = c.PhoneNo,
                                     HotLineNo = c.HotlineNo,
                                     FaxNo = c.FaxNo,
                                     WebSite = c.Website,
                                     UserEmailId = c.UserEmailId,
                                     UserEmailPassword = c.UserEmailPassword,
                                     IsEnableSSL = c.IsEnableSSL??false,
                                     SMTPHost = c.SMTPHost,
                                     SMTPPort = c.SMTPPort??0,
                                     FromEmailId = c.FromEmailId,
                                     ToEmailId=c.ReceiveEmailIds,
                                 };

                    Company _Company = _Query.FirstOrDefault();

                    if (_Company != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _Company;
                    }
                    else
                    {
                        _Result.Message = "NoRecordFoundMsg";
                        _Result.IsSuccess = false;
                    }
                }
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = _Exception.Message;
                _Result.Exception = _Exception;
            }
            return _Result;
        }

        public Result<Boolean> SaveCompany(Company p_Company, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    CompanyMaster _CompanyMaster = new CompanyMaster();

                    if (p_Company.CompanyID == Guid.Empty)
                    {
                        _CompanyMaster.CompanyID = Guid.NewGuid();
                        _CompanyMaster.ModifiedBy = p_UserId;
                        _CompanyMaster.IsActive = true;
                        _CompanyMaster.ModifiedDate = DateTime.Now;
                    }
                    else
                    {
                        _CompanyMaster = dbContext.CompanyMasters.Where(c => c.CompanyID == p_Company.CompanyID).FirstOrDefault();
                        _CompanyMaster.ModifiedDate = DateTime.Now;
                        _CompanyMaster.ModifiedBy = p_UserId;
                    }

                    _CompanyMaster.CompanyName = p_Company.CompanyName;
                    _CompanyMaster.EmailAddress = p_Company.EmailAddress;
                    _CompanyMaster.CountryId = p_Company.CountryId;
                    _CompanyMaster.StateId = p_Company.StateId;
                    _CompanyMaster.City = p_Company.City;
                    _CompanyMaster.Address = p_Company.Address;
                    _CompanyMaster.MobileNo = p_Company.MobileNo;
                    _CompanyMaster.PhoneNo = p_Company.PhoneNo;
                    _CompanyMaster.HotlineNo = p_Company.HotLineNo;
                    _CompanyMaster.FaxNo = p_Company.FaxNo;
                    _CompanyMaster.Website = p_Company.WebSite;
                    _CompanyMaster.UserEmailId = p_Company.UserEmailId;
                    _CompanyMaster.UserEmailPassword = p_Company.UserEmailPassword;
                    _CompanyMaster.IsEnableSSL = p_Company.IsEnableSSL;
                    _CompanyMaster.SMTPHost = p_Company.SMTPHost;
                    _CompanyMaster.SMTPPort = p_Company.SMTPPort;
                    _CompanyMaster.FromEmailId = p_Company.FromEmailId;
                    _CompanyMaster.ReceiveEmailIds = p_Company.ToEmailId;

                    if (!string.IsNullOrEmpty(p_Company.CompanyLogo))
                    {
                        _CompanyMaster.CompanyLogo = p_Company.CompanyLogo;
                    }

                    if (p_Company.CompanyID == Guid.Empty)
                    {
                        dbContext.CompanyMasters.Add(_CompanyMaster);
                    }

                    dbContext.SaveChanges();
                    _Result.IsSuccess = true;
                    _Result.Id = Convert.ToString(_CompanyMaster.CompanyID);
                    _Result.Data = true;
                }
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = "ExceptionErrMsg";
                _Result.Exception = _Exception;
            }
            return _Result;
        }

    }
}
