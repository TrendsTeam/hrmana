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
    public class EmployeeAttendanceService : IEmployeeAttendanceService
    {
        public Result<List<EmployeeAttendances>> GetEmployeeAttendanceByEmployeeId(Guid p_EmployeeId, DateTime p_FromDate, DateTime p_ToDate)
        {
            Result<List<EmployeeAttendances>> _Result = new Result<List<EmployeeAttendances>>();

            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeAttendances
                                 where e.EmployeeId == p_EmployeeId && e.AttendanceDate >= p_FromDate && e.AttendanceDate <= p_ToDate && e.IsActive == true
                                 orderby e.AttendanceDate 
                                 select new EmployeeAttendances 
                                 {
                                     EmployeeAttendanceID = e.EmployeeAttendanceID,
                                     EmployeeId = e.EmployeeId,
                                     AttendanceDate = e.AttendanceDate,
                                     TimeIn = e.TimeIn,
                                     TimeOut = e.TimeOut,
                                     WorkingHours = e.WorkingHours,
                                     OverTimeHours = e.OverTimeHours,
                                     AttendanceType = e.AttendanceType ?? 4,
                                     Attendance = e.Attendance,
                                     Description = e.Description,
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

        public Result<Boolean> SaveEmployeeAttendance(List<EmployeeAttendances> p_EmployeeAttendance, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    foreach (EmployeeAttendances _EmployeeAttendances in p_EmployeeAttendance)
                    {
                        EmployeeAttendance _EmployeeAttendance = new EmployeeAttendance();

                        if (_EmployeeAttendances.EmployeeAttendanceID == Guid.Empty)
                        {
                            _EmployeeAttendance.EmployeeAttendanceID = Guid.NewGuid();
                            _EmployeeAttendance.CreatedDate = DateTime.Now;
                            _EmployeeAttendance.CreatedBy = p_UserId;
                            _EmployeeAttendance.ModifiedBy = p_UserId;
                            _EmployeeAttendance.ModifiedDate = DateTime.Now;
                            _EmployeeAttendance.IsActive = true;
                        }
                        else
                        {
                            _EmployeeAttendance = dbContext.EmployeeAttendances.Where(e => e.EmployeeAttendanceID == _EmployeeAttendances.EmployeeAttendanceID).FirstOrDefault();
                            _EmployeeAttendance.ModifiedBy = p_UserId;
                            _EmployeeAttendance.ModifiedDate = DateTime.Now;
                        }

                        _EmployeeAttendance.FinancialYearId = _EmployeeAttendances.FinancialYearId;

                        _EmployeeAttendance.EmployeeId = _EmployeeAttendances.EmployeeId;
                        _EmployeeAttendance.AttendanceDate = _EmployeeAttendances.AttendanceDate;
                        _EmployeeAttendance.TimeIn = _EmployeeAttendances.TimeIn;
                        _EmployeeAttendance.TimeOut = _EmployeeAttendances.TimeOut;
                        _EmployeeAttendance.WorkingHours = _EmployeeAttendances.WorkingHours??0;
                        _EmployeeAttendance.OverTimeHours = _EmployeeAttendances.OverTimeHours??0;
                        _EmployeeAttendance.AttendanceType = _EmployeeAttendances.AttendanceType;
                        _EmployeeAttendance.Attendance = _EmployeeAttendances.Attendance;
                        _EmployeeAttendance.Description = _EmployeeAttendances.Description;

                        if (_EmployeeAttendances.EmployeeAttendanceID == Guid.Empty)
                        {
                            dbContext.EmployeeAttendances.Add(_EmployeeAttendance);
                        }

                        dbContext.SaveChanges();
                    }
                }

                _Result.IsSuccess = true;
                _Result.Data = true;
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
