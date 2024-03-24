﻿using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class HolidayService : IHolidayService
    {
        public Result<List<Holiday>> GetHolidayList()
        {
            Result<List<Holiday>> _Result = new Result<List<Holiday>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from h in dbContext.HolidayMasters
                                 where h.IsActive == true
                                 select new Holiday
                                 {
                                     HolidayID = h.HolidayID,
                                     Title = h.Title,
                                     Description = h.Description,
                                     StartDate = h.StartDate ?? DateTime.Now,
                                     EndDate = h.EndDate ?? DateTime.Now
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

        public Result<List<Holiday>> GetHolidayListByDate(DateTime p_FromDate, DateTime p_ToDate)
        {
            Result<List<Holiday>> _Result = new Result<List<Holiday>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from h in dbContext.HolidayMasters
                                 where h.IsActive == true && h.StartDate >= p_FromDate && h.StartDate <= p_ToDate
                                 select new Holiday
                                 {
                                     Title = h.Title,
                                     StartDate = h.StartDate ?? DateTime.Now,
                                     EndDate = h.EndDate ?? DateTime.Now
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

        public Result<Boolean> DeleteHolidayById(Guid p_HolidayId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    HolidayMaster _HolidayMaster = dbContext.HolidayMasters.Where(h => h.HolidayID == p_HolidayId).FirstOrDefault();

                    if (_HolidayMaster != null)
                    {
                        _HolidayMaster.IsActive = false;
                        _HolidayMaster.ModifiedDate = DateTime.Now;
                        _HolidayMaster.ModifiedBy = p_UserId;

                        dbContext.SaveChanges();
                        _Result.IsSuccess = true;
                    }
                    else
                    {
                        _Result.Message = "NoRecordFoundMsg";
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

        public Result<Holiday> GetHolidayById(Guid p_HolidayId)
        {
            Result<Holiday> _Result = new Result<Holiday>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from h in dbContext.HolidayMasters
                                 where h.HolidayID == p_HolidayId
                                 select new Holiday
                                 {
                                     HolidayID = h.HolidayID,
                                     Title = h.Title,
                                     Description = h.Description,
                                     StartDate = h.StartDate ?? DateTime.Now,
                                     EndDate = h.EndDate ?? DateTime.Now
                                 };

                    Holiday _Holiday = _Query.FirstOrDefault();
                    if (_Holiday != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _Holiday;
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

        public Result<Boolean> SaveHoliday(Holiday p_Holiday, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    HolidayMaster _HolidayMaster = new HolidayMaster();

                    if (p_Holiday.HolidayID == Guid.Empty)
                    {
                        _HolidayMaster.HolidayID = Guid.NewGuid();
                        _HolidayMaster.IsActive = true;
                        _HolidayMaster.CreatedDate = DateTime.Now;
                        _HolidayMaster.CreatedBy = p_UserId;
                        _HolidayMaster.ModifiedDate = DateTime.Now;
                    }
                    else
                    {
                        _HolidayMaster = dbContext.HolidayMasters.Where(h => h.HolidayID == p_Holiday.HolidayID).FirstOrDefault();

                        _HolidayMaster.ModifiedDate = DateTime.Now;
                        _HolidayMaster.ModifiedBy = p_UserId;
                    }

                    _HolidayMaster.Title = p_Holiday.Title;
                    _HolidayMaster.Description = p_Holiday.Description;
                    _HolidayMaster.StartDate = p_Holiday.StartDate;
                    _HolidayMaster.EndDate = p_Holiday.EndDate;

                    if (p_Holiday.HolidayID == Guid.Empty)
                    {
                        dbContext.HolidayMasters.Add(_HolidayMaster);
                    }

                    dbContext.SaveChanges();

                    _Result.IsSuccess = true;
                    _Result.Id = Convert.ToString(_HolidayMaster.HolidayID);
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
