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
    public class EmployeeDeviceMapService : IEmployeeDeviceMapService
    {
        public Result<bool> InsertEmployeeDeviceAttendance(EmployeeDeviceMaps p_EmployeeDeviceMap)
        {
            Result<bool> _Result = new Result<bool>();
            try
            {
                _Result.IsSuccess = false;

                SqlCommand _SqlCommand = new SqlCommand();

                string _Query = @"insert into EmployeeDeviceMap (EmployeeDeviceID,EmployeeId,DeviceId,EnrollNo,CreatedDate,IsActive) 
                                values (@EmployeeDeviceID,@EmployeeId,@DeviceId,@EnrollNo,@CreatedDate,@IsActive)";

                _SqlCommand.CommandText = _Query;

                _SqlCommand.Parameters.AddWithValue("@EmployeeDeviceID", Guid.NewGuid());
                _SqlCommand.Parameters.AddWithValue("@EmployeeId", p_EmployeeDeviceMap.EmployeeId);
                _SqlCommand.Parameters.AddWithValue("@DeviceId", p_EmployeeDeviceMap.DeviceId);
                _SqlCommand.Parameters.AddWithValue("@EnrollNo", p_EmployeeDeviceMap.EnrollmentNo);
                _SqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                _SqlCommand.Parameters.AddWithValue("@IsActive", true);

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

        public Result<List<EmployeeDeviceMaps>> GetAllEmployeeDeviceAttendanceByDeviceId(Guid p_DeviceId)
        {
            Result<List<EmployeeDeviceMaps>> _Result = new Result<List<EmployeeDeviceMaps>>();
            List<EmployeeDeviceMaps> ListOfEmployeeDeviceMap = new List<EmployeeDeviceMaps>();
            EmployeeDeviceMaps _EmployeeDeviceMap;
            try
            {
                _Result.IsSuccess = false;

                DataTable dataTable = new DataTable();

                string _Query = @"select EmployeeDeviceID,EmployeeId,DeviceId,EnrollNo from EmployeeDeviceMap where IsActive = 1 and DeviceId = @DeviceId";

                SqlCommand _SqlCommand = new SqlCommand(_Query);

                _SqlCommand.Parameters.AddWithValue("@DeviceId", Convert.ToString(p_DeviceId));

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeDeviceMap");

                if (_DataSet != null && _DataSet.Tables.Count > 0 && _DataSet.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataSet.Tables[0].Rows)
                    {
                        _EmployeeDeviceMap = new EmployeeDeviceMaps();
                        _EmployeeDeviceMap.EmployeeDeviceID = new Guid(Convert.ToString(row["EmployeeDeviceID"]));
                        _EmployeeDeviceMap.EmployeeId = new Guid(Convert.ToString(row["EmployeeId"]));
                        _EmployeeDeviceMap.DeviceId = new Guid(Convert.ToString(row["DeviceId"]));
                        _EmployeeDeviceMap.EnrollmentNo = Convert.ToString(row["EnrollNo"]);

                        ListOfEmployeeDeviceMap.Add(_EmployeeDeviceMap);
                        _Result.Data = ListOfEmployeeDeviceMap;
                        _Result.IsSuccess = true;
                    }
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

        public Result<List<EmployeeDeviceMaps>> GetAllEmployeeDeviceAttendance()
        {
            Result<List<EmployeeDeviceMaps>> _Result = new Result<List<EmployeeDeviceMaps>>();
            List<EmployeeDeviceMaps> ListOfEmployeeDeviceMap = new List<EmployeeDeviceMaps>();
            EmployeeDeviceMaps _EmployeeDeviceMap;
            try
            {
                _Result.IsSuccess = false;

                DataTable dataTable = new DataTable();

                string _Query = @"select EmployeeDeviceID,EmployeeId,DeviceId,EnrollNo from EmployeeDeviceMap where IsActive = 1";

                SqlCommand _SqlCommand = new SqlCommand(_Query);

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeDeviceMap");

                if (_DataSet != null && _DataSet.Tables.Count > 0 && _DataSet.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataSet.Tables[0].Rows)
                    {
                        _EmployeeDeviceMap = new EmployeeDeviceMaps();
                        _EmployeeDeviceMap.EmployeeDeviceID = new Guid(Convert.ToString(row["EmployeeDeviceID"]));
                        _EmployeeDeviceMap.EmployeeId = new Guid(Convert.ToString(row["EmployeeId"]));
                        _EmployeeDeviceMap.DeviceId = new Guid(Convert.ToString(row["DeviceId"]));
                        _EmployeeDeviceMap.EnrollmentNo = Convert.ToString(row["EnrollNo"]);

                        ListOfEmployeeDeviceMap.Add(_EmployeeDeviceMap);
                        _Result.Data = ListOfEmployeeDeviceMap;
                        _Result.IsSuccess = true;
                    }
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

        public Result<DataTable> GetEmployeeEnrolls(Guid p_DeviceId)
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = "select EnrollNo,EmployeeId from EmployeeDeviceMap where IsActive=1 and IsNull(EnrollNo,'')<>'' and DeviceId=@DeviceId";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@DeviceId", p_DeviceId);

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeDeviceMap");

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
