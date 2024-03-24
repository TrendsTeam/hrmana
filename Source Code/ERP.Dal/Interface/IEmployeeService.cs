using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IEmployeeService
    {
        Result<List<Employee>> GetEmployeeList();

        Result<Boolean> DeleteEmployeeById(Guid p_EmployeeId, Guid p_UserId);

        Result<int> GetMaxEmployeeNo();

        Result<Employee> GetEmployeeById(Guid p_EmployeeId);
              
        Result<Boolean> SaveEmployee(Employee p_Employee, Guid p_UserId);

        Result<Boolean> UpdateEmployeeProfile(Employee p_Employee, Guid p_UserId);

        Result<Boolean> ResignEmployee(Employee p_Employee, Guid p_UserId);

        Result<List<Employee>> EmployeeDetailReport(string p_EmployeeTypeId,Boolean? P_IsResign,DateTime p_FromDate,DateTime p_ToDate);

        Result<Boolean> UpdateEmployeeShift(Guid p_EmployeeId, Guid p_ShiftId, Guid p_UserId);

        Result<DashBoard> GetAdminDashBoard();

        Result<DataTable> GetAllEmployees();

        Result<List<Employee>> GetAllSendPendingEmployeeByDevice(Guid p_DeviceId);

        Result<bool> SaveEmployeeFingerPrint(Employee p_Employee);

        Result<DataTable> GetAllEmployeeFirstName();

        Result<DataTable> GetEmployeeAttendanceReportByEmpoyeeIdAndDate(string p_EmployeeName, DateTime p_FromDate, DateTime p_ToDate, Guid p_DeviceId);

        Result<List<Employee>> EmployeeUpcomingBirthday();

        Result<Guid?> GetEmployeeIdByEmployeeNo(int p_EmployeeNo);

    }
}
