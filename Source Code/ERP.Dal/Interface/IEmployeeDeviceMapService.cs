using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IEmployeeDeviceMapService
    {
        Result<bool> InsertEmployeeDeviceAttendance(EmployeeDeviceMaps p_EmployeeDeviceMap);

        Result<List<EmployeeDeviceMaps>> GetAllEmployeeDeviceAttendanceByDeviceId(Guid p_DeviceId);

        Result<List<EmployeeDeviceMaps>> GetAllEmployeeDeviceAttendance();

        Result<DataTable> GetEmployeeEnrolls(Guid p_DeviceId);
    }
}
