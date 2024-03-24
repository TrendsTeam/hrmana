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
    public class VisitService : IVisitService
    {
        public Result<List<Visit>> GetVisitList()
        {
            Result<List<Visit>> _Result = new Result<List<Visit>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from v in dbContext.VisitMasters
                                 where v.IsActive == true
                                 select new Visit
                                 {
                                     VisitID = v.VisitID,
                                     FullName = v.FullName,
                                     NoOfPerson = v.NoOfPerson??0,
                                     EmailAddress = v.Email,
                                     MobileNo = v.MobileNo,
                                     Address = v.Address,
                                     VisitToName = v.VisitToName,
                                     VisitReference = v.VisitReference,
                                     Relation = v.Relation,
                                     Purpose = v.Purpose,
                                     VisitInDateTime = v.VisitInDateTime??DateTime.Now,
                                     VisitOutDateTime = v.VisitOutDateTime ?? DateTime.Now,
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

        public Result<Boolean> DeleteVisitById(Guid p_VisitId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    VisitMaster _VisitMaster = dbContext.VisitMasters.Where(v => v.VisitID == p_VisitId).FirstOrDefault();

                    if (_VisitMaster != null)
                    {
                        _VisitMaster.IsActive = false;
                        _VisitMaster.ModifiedDate = DateTime.Now;
                        _VisitMaster.ModifiedBy = p_UserId;

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

        public Result<Visit> GetVisitById(Guid p_VisitId)
        {
            Result<Visit> _Result = new Result<Visit>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from v in dbContext.VisitMasters
                                 where v.VisitID == p_VisitId
                                 select new Visit
                                 {
                                     VisitID = v.VisitID,
                                     FullName = v.FullName,
                                     NoOfPerson = v.NoOfPerson ?? 0,
                                     EmailAddress = v.Email,
                                     MobileNo = v.MobileNo,
                                     Address = v.Address,
                                     VisitToName = v.VisitToName,
                                     VisitReference = v.VisitReference,
                                     Relation = v.Relation,
                                     Purpose = v.Purpose,
                                     VisitInDateTime = v.VisitInDateTime ?? DateTime.Now,
                                     VisitOutDateTime = v.VisitOutDateTime ?? DateTime.Now,
                                 };

                    Visit _Visit = _Query.FirstOrDefault();
                    if (_Visit != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _Visit;
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

        public Result<Boolean> SaveVisit(Visit p_Visit, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    VisitMaster _VisitMaster = new VisitMaster();

                    if (p_Visit.VisitID == Guid.Empty)
                    {
                        _VisitMaster.VisitID = Guid.NewGuid();
                        _VisitMaster.IsActive = true;
                        _VisitMaster.CreatedDate = DateTime.Now;
                        _VisitMaster.CreatedBy = p_UserId;
                        _VisitMaster.ModifiedDate = DateTime.Now;
                    }
                    else
                    {
                        _VisitMaster = dbContext.VisitMasters.Where(v => v.VisitID == p_Visit.VisitID).FirstOrDefault();

                        _VisitMaster.ModifiedDate = DateTime.Now;
                        _VisitMaster.ModifiedBy = p_UserId;
                    }

                    _VisitMaster.FullName = p_Visit.FullName;
                    _VisitMaster.NoOfPerson = p_Visit.NoOfPerson;
                    _VisitMaster.Email = p_Visit.EmailAddress;
                    _VisitMaster.MobileNo = p_Visit.MobileNo;
                    _VisitMaster.Address = p_Visit.Address;
                    _VisitMaster.VisitToName = p_Visit.VisitToName;
                    _VisitMaster.VisitReference = p_Visit.VisitReference;
                    _VisitMaster.Relation = p_Visit.Relation;
                    _VisitMaster.Purpose = p_Visit.Purpose;
                    _VisitMaster.VisitInDateTime = p_Visit.VisitInDateTime;
                    _VisitMaster.VisitOutDateTime = p_Visit.VisitOutDateTime;

                    if (p_Visit.VisitID == Guid.Empty)
                    {
                        dbContext.VisitMasters.Add(_VisitMaster);
                    }

                    dbContext.SaveChanges();

                    _Result.IsSuccess = true;
                    _Result.Id = Convert.ToString(_VisitMaster.VisitID);
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
