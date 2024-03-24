using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IDeviceService
    {
        Result<DataTable> GetAllDevice();

        Result<bool> DeleteDeviceById(Guid p_DeviceId, Guid p_UserId);

        Result<Device> GetDeviceById(Guid p_DeviceId);

        Result<bool> SaveDevice(Device p_Device, Guid p_UserId);

        Result<bool> CheckDuplicateDevice(string p_Device, Guid? p_DeviceId);

        Result<DataTable> GetAllDeviceName();
    }
}
