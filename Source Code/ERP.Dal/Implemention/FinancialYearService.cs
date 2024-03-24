using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class FinancialYearService : IFinancialYearService
    {
        public Result<FinancialYear> GetFinancialYearById(Guid p_FinancialYearId)
        {
            Result<FinancialYear> _Result = new Result<FinancialYear>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from f in dbContext.FinancialYearMasters
                                 where f.FinancialYearID == p_FinancialYearId
                                 select new FinancialYear
                                 {
                                     FinancialYearText = f.FinancialYear,
                                     Year = f.Year,
                                     StartMonth=f.StartMonth,
                                     EndMonth=f.EndMonth
                                 };

                    _Result.Data = _Query.First();
                }

                _Result.IsSuccess = true;
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = _Exception.Message;
                _Result.Exception = _Exception;
            }
            return _Result;
        }

        public Result<List<FinancialYear>> GetFinancialYearList()
        {
            Result<List<FinancialYear>> _Result = new Result<List<FinancialYear>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from f in dbContext.FinancialYearMasters
                                 where f.IsActive == true
                                 orderby f.Year
                                 select new FinancialYear
                                 {
                                     FinancialYearId = f.FinancialYearID,
                                     FinancialYearText = f.FinancialYear,
                                     Year = f.Year,
                                     StartMonth = f.StartMonth,
                                     EndMonth = f.EndMonth
                                 };

                    _Result.Data = _Query.ToList();

                    if (_Result.Data!=null)
                    {
                        foreach (FinancialYear item in _Result.Data)
                        {
                            string _MonthText = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(item.StartMonth) + " " + item.Year;

                            if (item.EndMonth==12)
                            {
                                _MonthText = _MonthText + " - " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(item.EndMonth) + " " + item.Year;
                            }
                            else
                            {
                                _MonthText = _MonthText + " - " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(item.EndMonth) + " " + (item.Year+1);
                            }

                            item.FinancialMonthText = _MonthText;
                        }
                    }
                }

                _Result.IsSuccess = true;
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = _Exception.Message;
                _Result.Exception = _Exception;
            }
            return _Result;
        }

        public Result<Boolean> DeleteFinancialYearById(Guid p_FinancialYearId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    int _Count = dbContext.EmployeeAttendances.Where(ea => ea.FinancialYearId == p_FinancialYearId && ea.IsActive == true).Count();

                    if (_Count <= 0)
                    {
                        FinancialYearMaster _FinancialYearMaster = dbContext.FinancialYearMasters.Where(f => f.FinancialYearID == p_FinancialYearId).FirstOrDefault();

                        if (_FinancialYearMaster != null)
                        {
                            _FinancialYearMaster.IsActive = false;
                            _FinancialYearMaster.ModifiedDate = DateTime.Now;
                            _FinancialYearMaster.ModifiedBy = p_UserId;

                            dbContext.SaveChanges();
                            _Result.IsSuccess = true;
                        }
                        else
                        {
                            _Result.Message = "NoRecordFoundMsg";
                        }
                    }
                    else
                    {
                        _Result.Message = "ReferenceExistMsg";
                    }
                }

                if (_Result.IsSuccess)
                {
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

        public Result<Boolean> SaveFinancialYear(FinancialYear p_FinancialYear, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    FinancialYearMaster _FinancialYearMasterExist = dbContext.FinancialYearMasters.Where(f => f.FinancialYearID != p_FinancialYear.FinancialYearId && f.FinancialYear == p_FinancialYear.FinancialYearText && f.Year == p_FinancialYear.Year && f.IsActive == true).FirstOrDefault();

                    if (_FinancialYearMasterExist == null)
                    {
                        FinancialYearMaster _FinancialYearMaster = new FinancialYearMaster();

                        _FinancialYearMaster.FinancialYearID = Guid.NewGuid();
                        _FinancialYearMaster.FinancialYear = p_FinancialYear.FinancialYearText;
                        _FinancialYearMaster.Year = p_FinancialYear.Year;
                        _FinancialYearMaster.StartMonth = p_FinancialYear.StartMonth;
                        _FinancialYearMaster.EndMonth = p_FinancialYear.EndMonth;
                        _FinancialYearMaster.IsActive = true;
                        _FinancialYearMaster.CreatedDate = DateTime.Now;
                        _FinancialYearMaster.CreatedBy = p_UserId;
                        _FinancialYearMaster.ModifiedDate = DateTime.Now;

                        dbContext.FinancialYearMasters.Add(_FinancialYearMaster);

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_FinancialYearMaster.FinancialYearID);
                        _Result.Data = true;
                    }
                    else
                    {
                        _Result.IsSuccess = false;
                        _Result.Data = false;
                        _Result.Message = "AlreadyExistMsg";
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
    }
}
