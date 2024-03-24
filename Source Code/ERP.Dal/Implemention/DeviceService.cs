using ERP.Common;
using ERP.Dal.Interface;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Implemention
{
    public class DeviceService : IDeviceService
    {
        public Result<DataTable> GetAllDevice()
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                DataTable dataTable = new DataTable();

                string _Query = @"Select DeviceID,DeviceName,Address,DeviceCode,PhoneNo,Port,IPAddress,'" + Convert.ToString(ConnectionStatusValue.DisConnected) + "' ConnectionStatus from DeviceMaster where IsActive=1";

                SqlCommand _SqlCommand = new SqlCommand(_Query);
                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "Device");

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

        public Result<bool> DeleteDeviceById(Guid p_DeviceId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = "Update DeviceMaster set IsActive=0,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy where DeviceID=@DeviceID";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                _SqlCommand.Parameters.AddWithValue("@ModifiedBy", p_UserId);
                _SqlCommand.Parameters.AddWithValue("@DeviceID", p_DeviceId);

                int _RowEffected = SqlDataAccess.ExecuteOperation(_SqlCommand);

                if (_RowEffected > 0)
                {
                    _Result.IsSuccess = true;
                    _Result.Data = true;
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

        public Result<Device> GetDeviceById(Guid p_DeviceID)
        {
            Result<Device> _Result = new Result<Device>();
            Device _Device = new Device();
            try
            {
                _Result.IsSuccess = false;

                string _Query = @"Select DeviceID,DeviceName,Address,DeviceCode,PhoneNo,Port,IPAddress from DeviceMaster where DeviceID=@DeviceID";

                SqlCommand _SqlCommand = new SqlCommand();

                _SqlCommand.CommandText = _Query;
                _SqlCommand.Parameters.AddWithValue("@DeviceID", p_DeviceID);

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "Device");

                if (_DataSet != null)
                {
                    if (_DataSet.Tables.Count > 0)
                    {
                        _Device.DeviceID = new Guid(_DataSet.Tables[0].Rows[0]["DeviceID"].ToString());
                        _Device.DeviceName = _DataSet.Tables[0].Rows[0]["DeviceName"].ToString();
                        _Device.Address = _DataSet.Tables[0].Rows[0]["Address"].ToString();
                        _Device.DeviceCode = _DataSet.Tables[0].Rows[0]["DeviceCode"].ToString();
                        _Device.PhoneNo = _DataSet.Tables[0].Rows[0]["PhoneNo"].ToString();
                        _Device.Port = _DataSet.Tables[0].Rows[0]["Port"].ToString();
                        _Device.IPAddress = _DataSet.Tables[0].Rows[0]["IPAddress"].ToString();

                        _Result.Data = _Device;
                        _Result.IsSuccess = true;
                    }
                }

                _Result.Message = Messages.NoRecordMsg;
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = Messages.ExceptionMsg;
                _Result.Exception = _Exception;
            }
            return _Result;
        }

        public Result<bool> SaveDevice(Device p_Device, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                SqlCommand _SqlCommand = new SqlCommand();

                string _Query = @"insert into DeviceMaster (DeviceID,DeviceName,Address,DeviceCode,PhoneNo,Port,IPAddress,CreatedBy,CreatedDate,IsActive) 
                                values (@DeviceID,@DeviceName,@Address,@DeviceCode,@PhoneNo,@Port,@IPAddress,@CreatedBy,@CreatedDate,@IsActive)";

                if (p_Device.DeviceID != null)
                {
                    _Query = @"Update DeviceMaster set DeviceName=@DeviceName,Address=@Address,DeviceCode=@DeviceCode,PhoneNo=@PhoneNo,
                                    Port=@Port,IPAddress=@IPAddress,ModifiedBy=@ModifiedBy,ModifiedDate=@ModifiedDate where DeviceID=@DeviceID";
                }


                _SqlCommand.CommandText = _Query;

                _SqlCommand.Parameters.AddWithValue("@DeviceName", p_Device.DeviceName);
                _SqlCommand.Parameters.AddWithValue("@Address", p_Device.Address);
                _SqlCommand.Parameters.AddWithValue("@DeviceCode", p_Device.DeviceCode);
                _SqlCommand.Parameters.AddWithValue("@PhoneNo", p_Device.PhoneNo);
                _SqlCommand.Parameters.AddWithValue("@Port", p_Device.Port);
                _SqlCommand.Parameters.AddWithValue("@IPAddress", p_Device.IPAddress);

                if (p_Device.DeviceID == null)
                {
                    _SqlCommand.Parameters.AddWithValue("@DeviceID", Guid.NewGuid());
                    _SqlCommand.Parameters.AddWithValue("@CreatedBy", p_UserId);
                    _SqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    _SqlCommand.Parameters.AddWithValue("@IsActive", true);
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@ModifiedBy", p_UserId);
                    _SqlCommand.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                    _SqlCommand.Parameters.AddWithValue("@DeviceID", p_Device.DeviceID);
                }

                int _RowEffected = SqlDataAccess.ExecuteOperation(_SqlCommand);

                if (_RowEffected > 0)
                {
                    _Result.IsSuccess = true;
                    _Result.Data = true;
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

        public Result<bool> CheckDuplicateDevice(string p_Device, Guid? p_DeviceId)
        {
            Result<bool> _Result = new Result<bool>();
            try
            {
                _Result.IsSuccess = false;
                if (p_DeviceId == null)
                {
                    p_DeviceId = Guid.NewGuid();
                }
                string _Query = "select count(DeviceID) from DeviceMaster where IsActive=1 and DeviceName=@DeviceName and DeviceID<>@DeviceID";

                SqlCommand _SqlCommand = new SqlCommand(_Query);
                _SqlCommand.Parameters.AddWithValue("@DeviceName", p_Device);
                _SqlCommand.Parameters.AddWithValue("@DeviceID", p_DeviceId);

                int _Count = Convert.ToInt32(SqlDataAccess.ExecuteScalar(_SqlCommand));

                if (_Count > 0)
                {
                    _Result.Data = true;
                }
                else
                {
                    _Result.Data = false;
                }
                _Result.IsSuccess = true;
            }
            catch (Exception _Exception)
            {
                _Result.IsSuccess = false;
                _Result.Message = Messages.ExceptionMsg;
                _Result.Exception = _Exception;
            }
            return _Result;
        }

        public Result<DataTable> GetAllDeviceName()
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = "select DeviceID,(DeviceName+' - '+DeviceCode) as Device,IPAddress,Port from DeviceMaster where IsActive=1 order by Device";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "DeviceMaster");

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
    }
}
