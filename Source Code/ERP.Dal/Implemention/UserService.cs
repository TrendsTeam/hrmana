using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class UserService : IUserService
    {
        public Result<SessionDetail> CheckLogin(string p_UserName, string p_Password)
        {
            Result<SessionDetail> _Result = new Result<SessionDetail>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    UserMaster _UserMaster = dbContext.UserMasters.Where(u => u.Username == p_UserName && u.Password == p_Password && u.IsActive == true).FirstOrDefault();

                    if (_UserMaster != null)
                    {
                        SessionDetail _SessionDetail = new SessionDetail();

                        _UserMaster.LastLogin = DateTime.Now;
                        dbContext.SaveChanges();

                        Guid _RoleId = new Guid(GlobalHelper.GetEnumDescription(Role.Administrator));

                        if (_UserMaster.RoleId == _RoleId)
                        {
                            _SessionDetail.UserID = _UserMaster.UserID;
                            _SessionDetail.Email = _UserMaster.Username;
                            _SessionDetail.RoleId = _UserMaster.RoleId;
                            _SessionDetail.FullName = _UserMaster.Username;

                            _Result.IsSuccess = true;
                        }
                        else
                        {
                            bool _Flag = true;
                            if (_UserMaster.EmployeeMaster != null)
                            {
                                if (_UserMaster.EmployeeMaster.IsActive && _UserMaster.EmployeeMaster.IsLeave == false)
                                {
                                    _SessionDetail.UserID = _UserMaster.UserID;
                                    _SessionDetail.Email = _UserMaster.Username;
                                    _SessionDetail.RoleId = _UserMaster.RoleId;
                                    _SessionDetail.FullName = _UserMaster.EmployeeMaster.FirstName + " " + _UserMaster.EmployeeMaster.LastName;
                                    _SessionDetail.PhotoName = _UserMaster.EmployeeMaster.PhotoName;
                                    _SessionDetail.EmployeeId = _UserMaster.EmployeeMaster.EmployeeID;
                                    _SessionDetail.EmployeeNo = _UserMaster.EmployeeMaster.EmployeeNo;

                                    _Flag = false;

                                    _Result.IsSuccess = true;
                                }
                            }

                            if (_Flag)
                            {
                                _Result.Message = "AuthenticationFailMsg";
                            }
                        }

                        _SessionDetail.CompanyLogo = dbContext.CompanyMasters.Select(c => c.CompanyLogo).FirstOrDefault();
                        _SessionDetail.FinancialYearId = dbContext.FinancialYearMasters.OrderByDescending(f => f.FinancialYear).Select(f => f.FinancialYearID).FirstOrDefault();

                        _Result.Data = _SessionDetail;
                    }
                    else
                    {
                        _Result.Message = "AuthenticationFailMsg";
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

        public Result<String> CheckUserByUserName(string p_UserName)
        {
            Result<String> _Result = new Result<String>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    Guid _RoleId = new Guid(GlobalHelper.GetEnumDescription(Role.Employee));

                    UserMaster _UserMaster = dbContext.UserMasters.Where(u => u.Username == p_UserName && u.IsActive == true && u.RoleId == _RoleId).FirstOrDefault();

                    bool _Flag = true;

                    if (_UserMaster != null)
                    {
                        if (_UserMaster.EmployeeMaster != null)
                        {
                            if (_UserMaster.EmployeeMaster.IsActive)
                            {
                                _Result.Id = Convert.ToString(_UserMaster.UserID);
                                _Result.Data = _UserMaster.EmployeeMaster.FirstName + " " + _UserMaster.EmployeeMaster.LastName;
                                _Result.IsSuccess = true;

                                _Flag = false;
                            }
                        }
                    }

                    if (_Flag)
                    {
                        _Result.Message ="UsernameNotExistsMsg";
                    }
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

        public Result<Boolean> ResetPassword(Guid p_UserId, string p_Password)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    UserMaster _UserMaster = dbContext.UserMasters.Where(u => u.UserID == p_UserId && u.IsActive == true).FirstOrDefault();

                    if (_UserMaster != null)
                    {
                        _UserMaster.ModifiedDate = DateTime.Now;
                        _UserMaster.ModifiedBy = _UserMaster.UserID;
                        _UserMaster.Password = p_Password;
                        dbContext.SaveChanges();
                        _Result.IsSuccess = true;
                    }
                    else
                    {
                        _Result.Message = "UsernameNotExistsMsg";
                    }

                    if (_Result.IsSuccess)
                    {
                        _Result.Data = true;
                    }
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

        public Result<Boolean> ChangePassword(Guid p_UserId, string p_OldPassword, string p_NewPassword)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    UserMaster _UserMaster = dbContext.UserMasters.Where(u => u.UserID == p_UserId && u.Password == p_OldPassword && u.IsActive == true).FirstOrDefault();

                    if (_UserMaster != null)
                    {
                        _UserMaster.ModifiedDate = DateTime.Now;
                        _UserMaster.ModifiedBy = _UserMaster.UserID;
                        _UserMaster.Password = p_NewPassword;
                        dbContext.SaveChanges();
                        _Result.IsSuccess = true;
                    }
                    else
                    {
                        _Result.Message = "OldPasswordNotMatchMsg";
                    }

                    if (_Result.IsSuccess)
                    {
                        _Result.Data = true;
                    }
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

        public Result<List<String>> GetAllReceiveApproveEmail()
        {
            Result<List<String>> _Result = new Result<List<String>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    string _ToEmail = dbContext.CompanyMasters.Select(c => c.ReceiveEmailIds).FirstOrDefault();

                    if (!string.IsNullOrEmpty(_ToEmail))
                    {
                        List<String> _ToEmails = new List<string>();

                        string[] _ToEmailSplit = _ToEmail.Split(',');

                        foreach (string email in _ToEmailSplit)
                        {
                            if (!string.IsNullOrEmpty(email))
                            {
                                _ToEmails.Add(email.Trim());
                            }
                        }

                        _Result.Data = _ToEmails;
                        _Result.IsSuccess = true;
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

        public Result<String> CheckBioMetricLogin(string p_UserName, string p_Password)
        {
            Result<String> _Result = new Result<String>();
            try
            {
                _Result.IsSuccess = false;

                Guid _RoleId = new Guid(GlobalHelper.GetEnumDescription(Role.Administrator));

                string _Query = "select UserID from UserMaster where IsActive=1 and RoleId='" + _RoleId + "' and Username='" + p_UserName + "' and Password='" + p_Password + "'";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                string _LoginResult = SqlDataAccess.ExecuteScalar(_SqlCommand);

                if (!string.IsNullOrEmpty(_LoginResult))
                {
                    _Result.IsSuccess = true;
                    _Result.Data = _LoginResult;
                }
                else
                {
                    _Result.Message = Messages.FailLogin;
                }
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = Messages.ExceptionMsg;
                _Result.Exception = _Exception;
            }
            return _Result;
        }
    }
}
