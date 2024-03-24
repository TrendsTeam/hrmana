using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class CountryService : ICountryService
    {
        public Result<List<Country>> GetCountryList()
        {
            Result<List<Country>> _Result = new Result<List<Country>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from c in dbContext.CountryMasters
                                      where c.IsActive == true
                                 select new Country
                                 {
                                     CountryID = c.CountryID,
                                     CountryName = c.CountryName,
                                     Code=c.Code,
                                 };

                    _Result.Data = _Query.ToList();
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

        public Result<Boolean> DeleteCountryById(Guid p_CountryId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    int _Count = dbContext.StateMasters.Where(s => s.CountryId == p_CountryId && s.IsActive == true).Count();

                    if (_Count <= 0)
                    {
                        CountryMaster _CountryMaster = dbContext.CountryMasters.Where(c => c.CountryID == p_CountryId).FirstOrDefault();

                        if (_CountryMaster != null)
                        {
                            _CountryMaster.IsActive = false;
                          
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

        public Result<Country> GetCountryById(Guid p_CountryId)
        {
            Result<Country> _Result = new Result<Country>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from c in dbContext.CountryMasters
                                 where c.CountryID == p_CountryId
                                 select new Country
                                 {
                                     CountryID = c.CountryID,
                                     CountryName = c.CountryName,
                                     Code=c.Code,
                                 };

                    Country _Country = _Query.FirstOrDefault();
                    if (_Country != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _Country;
                    }
                    else
                    {
                        _Result.Message = "NoRecordFoundMsg";
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

        public Result<Boolean> SaveCountry(Country p_Country, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    CountryMaster _CountryMasterExist = dbContext.CountryMasters.Where(c => c.CountryID != p_Country.CountryID && c.CountryName == p_Country.CountryName && c.IsActive == true).FirstOrDefault();

                    if (_CountryMasterExist == null)
                    {
                        CountryMaster _CountryMaster = new CountryMaster();

                        if (p_Country.CountryID == Guid.Empty)
                        {
                            _CountryMaster.CountryID = Guid.NewGuid();
                            _CountryMaster.IsActive = true;
                            _CountryMaster.CreatedDate = DateTime.Now;
                        }
                        else
                        {
                            _CountryMaster = dbContext.CountryMasters.Where(c => c.CountryID == p_Country.CountryID).FirstOrDefault();
                        }

                        _CountryMaster.CountryName = p_Country.CountryName;
                        _CountryMaster.Code = p_Country.Code;

                        if (p_Country.CountryID == Guid.Empty)
                        {
                            dbContext.CountryMasters.Add(_CountryMaster);
                        }

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_CountryMaster.CountryID);
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
