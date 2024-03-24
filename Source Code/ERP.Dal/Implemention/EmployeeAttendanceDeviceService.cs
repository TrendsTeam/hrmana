using ERP.Dal.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using ERP.Model;
using ERP.Common;
using System.Data.SqlClient;
using System.Data;

namespace ERP.Dal.Implemention
{
    public class EmployeeAttendanceDeviceService : IEmployeeAttendanceDeviceService
    {
        public Result<List<EmployeeAttendanceDevices>> GetEmployeeAttendanceDeviceByEmployeeId(Guid p_EmployeeId, DateTime p_FromDate, DateTime p_ToDate)
        {
            Result<List<EmployeeAttendanceDevices>> _Result = new Result<List<EmployeeAttendanceDevices>>();

            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeAttendanceDevices
                                 where e.EmployeeId == p_EmployeeId && e.AttendanceDate >= p_FromDate && e.AttendanceDate <= p_ToDate && e.IsActive == true
                                 orderby e.AttendanceDate
                                 select new EmployeeAttendanceDevices
                                 {
                                     EmployeeAttendanceID = e.EmployeeAttendanceID,
                                     EmployeeId = e.EmployeeId,
                                     EnrollNo = e.EnrollNo,
                                     AttendanceDate = e.AttendanceDate,
                                     AttendanceDateTime = e.AttendanceDateTime,
                                     PunchTime = e.PunchTime,
                                     VerifyMethod = e.VerifyMethod,
                                     PunchMethod = e.PunchMethod,
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

        public Result<DataTable> GetEmployeeAttendanceTimeByEmpoyeeIdAndDate(Guid? p_EmployeeId, DateTime p_CurrentDate)
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = "select PunchTime from EmployeeAttendanceDevice where IsActive=1 and AttendanceDate=@AttendanceDate and EmployeeId=@EmployeeId";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;
                _SqlCommand.Parameters.AddWithValue("@AttendanceDate", GlobalHelper.DateToString(p_CurrentDate));
                _SqlCommand.Parameters.AddWithValue("@EmployeeId", p_EmployeeId);

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeAttendanceDevice");

                if (_DataSet != null && _DataSet.Tables.Count > 0)
                {
                    _Result.Data = _DataSet.Tables[0];
                    _Result.IsSuccess = true;
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

        public Result<bool> SaveEmployeeAttendance(EmployeeAttendanceDevices p_EmployeeAttendanceDevice)
        {
            Result<bool> _Result = new Result<bool>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = @"INSERT INTO EmployeeAttendanceDevice(EmployeeAttendanceID,EmployeeId,DeviceId,EnrollNo,AttendanceDateTime,AttendanceDate,PunchTime,VerifyMethod,PunchMethod,CreatedDate,IsActive) 
                                                                VALUES(@EmployeeAttendanceID,@EmployeeId,@DeviceId,@EnrollNo,@AttendanceDateTime,@AttendanceDate,@PunchTime,@VerifyMethod,@PunchMethod,@CreatedDate,@IsActive)";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@EmployeeAttendanceID", Guid.NewGuid());
                _SqlCommand.Parameters.AddWithValue("@EmployeeId", p_EmployeeAttendanceDevice.EmployeeId);
                _SqlCommand.Parameters.AddWithValue("@DeviceId", p_EmployeeAttendanceDevice.DeviceId);
                _SqlCommand.Parameters.AddWithValue("@EnrollNo", p_EmployeeAttendanceDevice.EnrollNo);
                _SqlCommand.Parameters.AddWithValue("@AttendanceDateTime", p_EmployeeAttendanceDevice.AttendanceDateTime);
                _SqlCommand.Parameters.AddWithValue("@AttendanceDate", p_EmployeeAttendanceDevice.AttendanceDate);
                _SqlCommand.Parameters.AddWithValue("@PunchTime", p_EmployeeAttendanceDevice.PunchTime);
                _SqlCommand.Parameters.AddWithValue("@VerifyMethod", p_EmployeeAttendanceDevice.VerifyMethod);
                _SqlCommand.Parameters.AddWithValue("@PunchMethod", p_EmployeeAttendanceDevice.PunchMethod);
                _SqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                _SqlCommand.Parameters.AddWithValue("@IsActive", true);

                int _ResultOperation = SqlDataAccess.ExecuteOperation(_SqlCommand);

                if (_ResultOperation > 0)
                {
                    _Result.IsSuccess = true;
                    _Result.Data = true;
                }
                else
                {
                    _Result.Message = Messages.NoRecordMsg;
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

        public Result<List<EmployeeAttendanceDevices>> GetEmployeeAttendanceByLate(DateTime p_StartDate, DateTime p_EndDate, DateTime p_MorningLateStartTime, DateTime p_MorningLateEndTime, DateTime p_LunchLateStartTime, DateTime p_LunchLateEndTime)
        {
            Result<List<EmployeeAttendanceDevices>> _Result = new Result<List<EmployeeAttendanceDevices>>();
            List<EmployeeAttendanceDevices> _ListOfEmployeeAttendance = new List<EmployeeAttendanceDevices>();
            EmployeeAttendanceDevices _EmployeeAttendanceDevice;

            try
            {
                _Result.IsSuccess = false;

                string _Query = @"select ead.EmployeeId,EnrollNo,AttendanceDate,AttendanceDateTime,PunchTime,VerifyMethod,PunchMethod,em.Email,
                                     em.firstname+' ' +em.LastName FullName,dbo.GetTime(ead.AttendanceDate,em.EmployeeID) PunchTimes
                                     from EmployeeAttendanceDevice ead inner join EmployeeMaster em on  ead.EmployeeId = em.EmployeeID
									 where ead.IsActive = 1 and AttendanceDate >= @StartDate and AttendanceDate <= @EndDate and
                                     (CAST(PunchTime as Time) > @MorningLateStartTime and CAST(PunchTime as Time) < @MorningLateEndTime) or
                                     (CAST(PunchTime as Time) > @LunchLateStartTime and CAST(PunchTime as Time) < @LunchLateEndTime)";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@StartDate", GlobalHelper.DateToString(p_StartDate));
                _SqlCommand.Parameters.AddWithValue("@EndDate", GlobalHelper.DateToString(p_EndDate));

                _SqlCommand.Parameters.AddWithValue("@MorningLateStartTime", p_MorningLateStartTime.ToShortTimeString());
                _SqlCommand.Parameters.AddWithValue("@MorningLateEndTime", p_MorningLateEndTime.ToShortTimeString());

                _SqlCommand.Parameters.AddWithValue("@LunchLateStartTime", p_LunchLateStartTime.ToShortTimeString());
                _SqlCommand.Parameters.AddWithValue("@LunchLateEndTime", p_LunchLateEndTime.ToShortTimeString());

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeAttendanceDevice");

                if (_DataSet != null && _DataSet.Tables.Count > 0 && _DataSet.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataSet.Tables[0].Rows)
                    {
                        _EmployeeAttendanceDevice = new EmployeeAttendanceDevices();
                        _EmployeeAttendanceDevice.EmployeeId = new Guid(Convert.ToString(row["EmployeeId"]));
                        _EmployeeAttendanceDevice.EnrollNo = Convert.ToString(row["EnrollNo"]);
                        _EmployeeAttendanceDevice.AttendanceDate = Convert.ToDateTime(row["AttendanceDate"]);
                        _EmployeeAttendanceDevice.AttendanceDateTime = Convert.ToDateTime(row["AttendanceDateTime"]);
                        _EmployeeAttendanceDevice.PunchTime = Convert.ToString(row["PunchTime"]);
                        _EmployeeAttendanceDevice.VerifyMethod = Convert.ToString(row["VerifyMethod"]);
                        _EmployeeAttendanceDevice.PunchMethod = Convert.ToString(row["PunchMethod"]);
                        _EmployeeAttendanceDevice.FullName = Convert.ToString(row["FullName"]);
                        _EmployeeAttendanceDevice.PunchTimes = Convert.ToString(row["PunchTimes"]);
                        _EmployeeAttendanceDevice.Email = Convert.ToString(row["Email"]);

                        _ListOfEmployeeAttendance.Add(_EmployeeAttendanceDevice);
                    }

                    _Result.Data = _ListOfEmployeeAttendance;
                    _Result.IsSuccess = true;
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
