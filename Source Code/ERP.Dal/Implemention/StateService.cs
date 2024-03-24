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
    public class StateService : IStateService
    {
        public Result<List<State>> GetStateList()
        {
            Result<List<State>> _Result = new Result<List<State>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from s in dbContext.StateMasters
                                 join c in dbContext.CountryMasters on s.CountryId equals c.CountryID
                                 where s.IsActive == true && c.IsActive==true
                                 select new State
                                 {
                                     StateID=s.StateID,
                                     StateName=s.StateName,
                                     CountryId = c.CountryID,
                                     CountryName = c.CountryName,
                                     Code = c.Code,
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

        public Result<Boolean> DeleteStateById(Guid p_StateId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    int _Count = dbContext.EmployeeMasters.Where(e => e.StateId == p_StateId && e.IsActive == true).Count();

                    if (_Count <= 0)
                    {
                        StateMaster _StateMaster = dbContext.StateMasters.Where(s => s.StateID == p_StateId).FirstOrDefault();

                        if (_StateMaster != null)
                        {
                            _StateMaster.IsActive = false;

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
                        _Result.Message ="ReferenceExistMsg";
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

        public Result<State> GetStateById(Guid p_StateId)
        {
            Result<State> _Result = new Result<State>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from s in dbContext.StateMasters
                                 where s.StateID == p_StateId
                                 select new State
                                 {
                                     StateID = s.StateID,
                                     StateName = s.StateName,
                                     CountryId = s.CountryId ?? Guid.Empty,
                                 };

                    State _State = _Query.FirstOrDefault();
                    if (_State != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _State;
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

        public Result<Boolean> SaveState(State p_State, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    StateMaster _StateMasterExist = dbContext.StateMasters.Where(s => s.StateID != p_State.StateID && s.StateName == p_State.StateName && s.CountryId == p_State.CountryId && s.IsActive == true).FirstOrDefault();

                    if (_StateMasterExist == null)
                    {
                        StateMaster _StateMaster = new StateMaster();

                        if (p_State.StateID == Guid.Empty)
                        {
                            _StateMaster.StateID = Guid.NewGuid();
                            _StateMaster.IsActive = true;
                            _StateMaster.CreatedDate = DateTime.Now;
                        }
                        else
                        {
                            _StateMaster = dbContext.StateMasters.Where(s => s.StateID == p_State.StateID).FirstOrDefault();
                        }

                        _StateMaster.StateName = p_State.StateName;
                        _StateMaster.CountryId = p_State.CountryId;

                        if (p_State.StateID == Guid.Empty)
                        {
                            dbContext.StateMasters.Add(_StateMaster);
                        }

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_StateMaster.StateID);
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
