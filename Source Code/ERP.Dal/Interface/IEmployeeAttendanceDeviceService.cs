using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;

namespace ERP.Dal.Interface
{
    public interface IEmployeeAttendanceDeviceService
    {
        Result<List<EmployeeAttendanceDevices>> GetEmployeeAttendanceDeviceByEmployeeId(Guid p_EmployeeId, DateTime p_FromDate, DateTime p_ToDate);

        Result<DataTable> GetEmployeeAttendanceTimeByEmpoyeeIdAndDate(Guid? p_EmployeeId, DateTime p_CurrentDate);

        Result<bool> SaveEmployeeAttendance(EmployeeAttendanceDevices p_EmployeeAttendanceDevice);

        Result<List<EmployeeAttendanceDevices>> GetEmployeeAttendanceByLate(DateTime p_StartDate, DateTime p_EndDate, DateTime p_MorningLateStartTime, DateTime p_MorningLateEndTime, DateTime p_LunchLateStartTime, DateTime p_LunchLateEndTime);
    }
}
