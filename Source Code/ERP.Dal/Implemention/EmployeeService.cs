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
    public class EmployeeService : IEmployeeService
    {
        public Result<List<Employee>> GetEmployeeList()
        {
            Result<List<Employee>> _Result = new Result<List<Employee>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = (from e in dbContext.EmployeeMasters
                                  join et in dbContext.EmployeeTypeMasters on e.EmployeeTypeId equals et.EmployeeTypeID
                                  join d in dbContext.DepartmentMasters on e.DepartmentId equals d.DepartmentID
                                  join dg in dbContext.DesignationMasters on e.DesignationId equals dg.DesignationID
                                  join g in dbContext.EmployeeGradeMasters on e.EmployeeGradeId equals g.EmployeeGradeID
                                  join s in dbContext.ShiftMasters on e.ShiftId equals s.ShiftID
                                  where e.IsActive == true && et.IsActive == true && d.IsActive == true && dg.IsActive == true
                                  select new Employee
                             {
                                 EmployeeID = e.EmployeeID,
                                 FirstName = e.FirstName,
                                 LastName = e.LastName,
                                 Email = e.Email,
                                 EmployeeNo = e.EmployeeNo,
                                 EmployeeType = et.EmployeeType,
                                 Department = d.Department,
                                 Designation = dg.Designation,
                                 IsLeave = e.IsLeave,
                                 EmployeeGrade = g.EmployeeGrade,
                                 Shift = s.Shift,
                                 FromTime = s.FromTime,
                                 ToTime = s.ToTime,
                             });

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

        public Result<Boolean> DeleteEmployeeById(Guid p_EmployeeId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    //int _Count = dbContext.EmployeeMasters.Where(e => e.DepartmentId == p_DepartmentId && e.IsActive == true).Count();

                    //if (_Count <= 0)
                    //{
                    EmployeeMaster _EmployeeMaster = dbContext.EmployeeMasters.Where(e => e.EmployeeID == p_EmployeeId).FirstOrDefault();

                    if (_EmployeeMaster != null)
                    {
                        _EmployeeMaster.IsActive = false;
                        _EmployeeMaster.ModifiedDate = DateTime.Now;
                        _EmployeeMaster.ModifiedBy = p_UserId;

                        dbContext.SaveChanges();
                        _Result.IsSuccess = true;
                    }
                    else
                    {
                        _Result.Message = "NoRecordFoundMsg";
                    }
                    //}
                    //else
                    //{
                    //    _Result.Message = GlobalHelper.GetLanguageLabel("ReferenceExistMsg");
                    //}
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

        public Result<int> GetMaxEmployeeNo()
        {
            Result<int> _Result = new Result<int>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    int? _No = dbContext.EmployeeMasters.Max(e => (int?)e.EmployeeNo);
                    _Result.Data = (_No ?? 0) + 1;
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

        public Result<Employee> GetEmployeeById(Guid p_EmployeeId)
        {
            Result<Employee> _Result = new Result<Employee>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeMasters
                                 join s in dbContext.StateMasters on e.StateId equals s.StateID
                                 join c in dbContext.CountryMasters on e.CountryId equals c.CountryID
                                 where e.EmployeeID == p_EmployeeId
                                 select new Employee
                                 {
                                     EmployeeID = e.EmployeeID,
                                     EmployeeTypeId = e.EmployeeTypeId,
                                     EmployeeType = e.EmployeeTypeMaster.EmployeeType,
                                     EmployeeGradeId = e.EmployeeGradeId ?? Guid.Empty,
                                     EmployeeGrade = e.EmployeeGradeMaster != null ? e.EmployeeGradeMaster.EmployeeGrade : string.Empty,
                                     DepartmentId = e.DepartmentId,
                                     Department = e.DepartmentMaster.Department,
                                     DesignationId = e.DesignationId,
                                     Designation = e.DesignationMaster.Designation,
                                     ShiftId = e.ShiftId,
                                     Shift = e.ShiftMaster.Shift + " " + e.ShiftMaster.FromTime + " - " + e.ShiftMaster.ToTime,
                                     FromTime = e.ShiftMaster.FromTime,
                                     ToTime = e.ShiftMaster.ToTime,
                                     CountryId = e.CountryId ?? Guid.Empty,
                                     StateId = e.StateId ?? Guid.Empty,
                                     State = s.StateName,
                                     Country = c.CountryName,
                                     FirstName = e.FirstName,
                                     MiddleName = e.MiddleName,
                                     LastName = e.LastName,
                                     BirthDate = e.BirthDate ?? DateTime.Now,
                                     FatherName = e.FatherName,
                                     IsGender = e.Gender ?? true,
                                     MaratialStatus = e.MaratialStatus,
                                     Cast = e.Cast,
                                     City = e.City,
                                     Address = e.Address,
                                     PinCode = e.PinCode,
                                     MobileNo = e.MobileNo,
                                     PhoneNo = e.PhoneNo,
                                     JoinDate = e.JoinDate ?? DateTime.Now,
                                     EmployeeNo = e.EmployeeNo,
                                     PFNo = e.PFNo,
                                     Email = e.Email,
                                     BankName = e.BankName,
                                     BranchName = e.BranchName,
                                     AccountName = e.AccountName,
                                     AccountNo = e.AccountNo,
                                     PhotoName = e.PhotoName,
                                     LeaveDescription = e.LeaveDescription,
                                     IsLeave = e.IsLeave,
                                     LeaveDate = e.LeaveDate ?? DateTime.Now,
                                     WorkingDays = e.EmployeeWorkingDays.Select(ew => ew.DayName).ToList(),
                                     EmployeeAttachments = (from ea in e.EmployeeAttachments
                                                            select new EmployeeAttachments { AttachmentName = ea.AttachmentName, Name = ea.Name }).ToList()
                                 };

                    Employee _Employee = _Query.FirstOrDefault();

                    if (_Employee != null)
                    {
                        _Result.IsSuccess = true;
                        _Result.Data = _Employee;
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

        public Result<Boolean> SaveEmployee(Employee p_Employee, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    EmployeeMaster _EmployeeMasterExist = dbContext.EmployeeMasters.Where(e => e.EmployeeID != p_Employee.EmployeeID && e.Email == p_Employee.Email).FirstOrDefault();

                    if (_EmployeeMasterExist == null)
                    {
                        EmployeeMaster _EmployeeMaster = new EmployeeMaster();

                        if (p_Employee.EmployeeID == Guid.Empty)
                        {
                            _EmployeeMaster.EmployeeID = Guid.NewGuid();
                            _EmployeeMaster.IsActive = true;
                            _EmployeeMaster.CreatedDate = DateTime.Now;
                            _EmployeeMaster.CreatedBy = p_UserId;
                            _EmployeeMaster.ModifiedDate = DateTime.Now;
                            _EmployeeMaster.IsLeave = false;
                            _EmployeeMaster.LeaveDate = DateTime.Now;
                            _EmployeeMaster.EmployeeNo = p_Employee.EmployeeNo;
                        }
                        else
                        {
                            _EmployeeMaster = dbContext.EmployeeMasters.Where(e => e.EmployeeID == p_Employee.EmployeeID).FirstOrDefault();

                            _EmployeeMaster.ModifiedDate = DateTime.Now;
                            _EmployeeMaster.ModifiedBy = p_UserId;
                        }

                        _EmployeeMaster.EmployeeTypeId = p_Employee.EmployeeTypeId;
                        _EmployeeMaster.EmployeeGradeId = p_Employee.EmployeeGradeId;
                        _EmployeeMaster.DepartmentId = p_Employee.DepartmentId;
                        _EmployeeMaster.DesignationId = p_Employee.DesignationId;
                        _EmployeeMaster.ShiftId = p_Employee.ShiftId;
                        _EmployeeMaster.CountryId = p_Employee.CountryId;
                        _EmployeeMaster.StateId = p_Employee.StateId;
                        _EmployeeMaster.FirstName = p_Employee.FirstName;
                        _EmployeeMaster.MiddleName = p_Employee.MiddleName;
                        _EmployeeMaster.LastName = p_Employee.LastName;
                        _EmployeeMaster.BirthDate = p_Employee.BirthDate;
                        _EmployeeMaster.FatherName = p_Employee.FatherName;
                        _EmployeeMaster.Gender = p_Employee.IsGender;
                        _EmployeeMaster.MaratialStatus = p_Employee.MaratialStatus;
                        _EmployeeMaster.Cast = p_Employee.Cast;
                        _EmployeeMaster.City = p_Employee.City;
                        _EmployeeMaster.Address = p_Employee.Address;
                        _EmployeeMaster.PinCode = p_Employee.PinCode;
                        _EmployeeMaster.MobileNo = p_Employee.MobileNo;
                        _EmployeeMaster.PhoneNo = p_Employee.PhoneNo;
                        _EmployeeMaster.JoinDate = p_Employee.JoinDate;
                        _EmployeeMaster.PFNo = p_Employee.PFNo;
                        _EmployeeMaster.Email = p_Employee.Email;
                        _EmployeeMaster.BankName = p_Employee.BankName;
                        _EmployeeMaster.BranchName = p_Employee.BranchName;
                        _EmployeeMaster.AccountName = p_Employee.AccountName;
                        _EmployeeMaster.AccountNo = p_Employee.AccountNo;

                        if (!string.IsNullOrEmpty(p_Employee.PhotoName))
                        {
                            _EmployeeMaster.PhotoName = p_Employee.PhotoName;
                        }

                        if (p_Employee.EmployeeID == Guid.Empty)
                        {
                            dbContext.EmployeeMasters.Add(_EmployeeMaster);
                        }

                        dbContext.SaveChanges();

                        if (p_Employee.EmployeeID != Guid.Empty)
                        {
                            dbContext.EmployeeWorkingDays.RemoveRange(dbContext.EmployeeWorkingDays.Where(ew => ew.EmployeeId == _EmployeeMaster.EmployeeID));
                        }

                        foreach (String _WorkingDay in p_Employee.WorkingDays)
                        {
                            EmployeeWorkingDay _EmployeeWorkingDay = new EmployeeWorkingDay();

                            _EmployeeWorkingDay.EmployeeWorkingDayMapID = Guid.NewGuid();
                            _EmployeeWorkingDay.EmployeeId = _EmployeeMaster.EmployeeID;
                            _EmployeeWorkingDay.DayName = _WorkingDay;
                            _EmployeeWorkingDay.IsActive = true;
                            _EmployeeWorkingDay.CreatedDate = DateTime.Now;
                            _EmployeeWorkingDay.CreatedBy = p_UserId;
                            _EmployeeWorkingDay.ModifiedDate = DateTime.Now;

                            dbContext.EmployeeWorkingDays.Add(_EmployeeWorkingDay);
                        }

                        foreach (EmployeeAttachments _EmployeeAttachments in p_Employee.EmployeeAttachments)
                        {
                            if (_EmployeeAttachments.IsDelete)
                            {
                                dbContext.EmployeeAttachments.Remove(dbContext.EmployeeAttachments.Where(ea => ea.Name == _EmployeeAttachments.Name).FirstOrDefault());
                            }
                            else
                            {
                                EmployeeAttachment _EmployeeAttachment = new EmployeeAttachment();

                                _EmployeeAttachment = dbContext.EmployeeAttachments.Where(e => e.EmployeeId == _EmployeeMaster.EmployeeID && e.AttachmentName == _EmployeeAttachments.AttachmentName).FirstOrDefault();

                                if (_EmployeeAttachment != null)
                                {
                                    _EmployeeAttachment.ModifiedDate = DateTime.Now;
                                    _EmployeeAttachment.ModifiedBy = p_UserId;
                                    _EmployeeAttachment.Name = _EmployeeAttachments.Name;
                                }
                                else
                                {
                                    _EmployeeAttachment = new EmployeeAttachment();

                                    _EmployeeAttachment.EmployeeAttachmentMapID = Guid.NewGuid();
                                    _EmployeeAttachment.IsActive = true;
                                    _EmployeeAttachment.CreatedDate = DateTime.Now;
                                    _EmployeeAttachment.CreatedBy = p_UserId;
                                    _EmployeeAttachment.ModifiedDate = DateTime.Now;
                                    _EmployeeAttachment.EmployeeId = _EmployeeMaster.EmployeeID;
                                    _EmployeeAttachment.Name = _EmployeeAttachments.Name;
                                    _EmployeeAttachment.AttachmentName = _EmployeeAttachments.AttachmentName;

                                    dbContext.EmployeeAttachments.Add(_EmployeeAttachment);
                                }
                            }
                        }

                        if (p_Employee.EmployeeID == Guid.Empty)
                        {
                            UserMaster _UserMaster = new UserMaster();

                            _UserMaster.UserID = Guid.NewGuid();
                            _UserMaster.EmployeeId = _EmployeeMaster.EmployeeID;
                            _UserMaster.Username = _EmployeeMaster.Email;
                            _UserMaster.Password = SecurityHelper.EncryptString("default@123");
                            _UserMaster.RoleId = new Guid(GlobalHelper.GetEnumDescription(Role.Employee));
                            _UserMaster.IsActive = true;
                            _UserMaster.CreatedDate = DateTime.Now;
                            _UserMaster.CreatedBy = p_UserId;
                            _UserMaster.ModifiedDate = DateTime.Now;
                            _UserMaster.LastLogin = DateTime.Now;

                            dbContext.UserMasters.Add(_UserMaster);
                        }

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_EmployeeMaster.EmployeeID);
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

        public Result<Boolean> UpdateEmployeeProfile(Employee p_Employee, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    EmployeeMaster _EmployeeMaster = new EmployeeMaster();

                    _EmployeeMaster = dbContext.EmployeeMasters.Where(e => e.EmployeeID == p_Employee.EmployeeID).FirstOrDefault();

                    _EmployeeMaster.ModifiedDate = DateTime.Now;
                    _EmployeeMaster.ModifiedBy = p_UserId;

                    _EmployeeMaster.CountryId = p_Employee.CountryId;
                    _EmployeeMaster.StateId = p_Employee.StateId;
                    _EmployeeMaster.FirstName = p_Employee.FirstName;
                    _EmployeeMaster.MiddleName = p_Employee.MiddleName;
                    _EmployeeMaster.LastName = p_Employee.LastName;
                    _EmployeeMaster.BirthDate = p_Employee.BirthDate;
                    _EmployeeMaster.FatherName = p_Employee.FatherName;
                    _EmployeeMaster.Gender = p_Employee.IsGender;
                    _EmployeeMaster.MaratialStatus = p_Employee.MaratialStatus;
                    _EmployeeMaster.Cast = p_Employee.Cast;
                    _EmployeeMaster.City = p_Employee.City;
                    _EmployeeMaster.Address = p_Employee.Address;
                    _EmployeeMaster.PinCode = p_Employee.PinCode;
                    _EmployeeMaster.MobileNo = p_Employee.MobileNo;
                    _EmployeeMaster.PhoneNo = p_Employee.PhoneNo;

                    if (!string.IsNullOrEmpty(p_Employee.PhotoName))
                    {
                        _EmployeeMaster.PhotoName = p_Employee.PhotoName;
                    }

                    dbContext.SaveChanges();

                    _Result.IsSuccess = true;
                    _Result.Id = Convert.ToString(_EmployeeMaster.EmployeeID);
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

        public Result<Boolean> ResignEmployee(Employee p_Employee, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    EmployeeMaster _EmployeeMaster = dbContext.EmployeeMasters.Where(e => e.EmployeeID == p_Employee.EmployeeID).FirstOrDefault();
                    if (_EmployeeMaster != null)
                    {
                        _EmployeeMaster.ModifiedBy = p_UserId;
                        _EmployeeMaster.ModifiedDate = DateTime.Now;
                        _EmployeeMaster.LeaveDate = p_Employee.LeaveDate;
                        _EmployeeMaster.LeaveDescription = p_Employee.LeaveDescription;
                        _EmployeeMaster.IsLeave = true;

                        dbContext.SaveChanges();

                        EmployeeAttachments _EmployeeAttachments = p_Employee.EmployeeAttachments.FirstOrDefault();

                        if (_EmployeeAttachments != null)
                        {
                            if (_EmployeeAttachments.IsDelete)
                            {
                                dbContext.EmployeeAttachments.Remove(dbContext.EmployeeAttachments.Where(ea => ea.Name == _EmployeeAttachments.Name).FirstOrDefault());
                            }
                            else
                            {
                                EmployeeAttachment _EmployeeAttachment = new EmployeeAttachment();
                                _EmployeeAttachment = dbContext.EmployeeAttachments.Where(e => e.EmployeeId == _EmployeeMaster.EmployeeID && e.AttachmentName == _EmployeeAttachments.AttachmentName).FirstOrDefault();
                                if (_EmployeeAttachment != null)
                                {
                                    _EmployeeAttachment.ModifiedDate = DateTime.Now;
                                    _EmployeeAttachment.ModifiedBy = p_UserId;
                                    _EmployeeAttachment.Name = _EmployeeAttachments.Name;
                                }
                                else
                                {
                                    _EmployeeAttachment = new EmployeeAttachment();

                                    _EmployeeAttachment.EmployeeAttachmentMapID = Guid.NewGuid();
                                    _EmployeeAttachment.IsActive = true;
                                    _EmployeeAttachment.CreatedDate = DateTime.Now;
                                    _EmployeeAttachment.CreatedBy = p_UserId;
                                    _EmployeeAttachment.ModifiedDate = DateTime.Now;
                                    _EmployeeAttachment.EmployeeId = _EmployeeMaster.EmployeeID;
                                    _EmployeeAttachment.Name = _EmployeeAttachments.Name;
                                    _EmployeeAttachment.AttachmentName = _EmployeeAttachments.AttachmentName;

                                    dbContext.EmployeeAttachments.Add(_EmployeeAttachment);
                                }
                            }
                        }

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_EmployeeMaster.EmployeeID);
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

        public Result<List<Employee>> EmployeeDetailReport(string p_EmployeeTypeId, Boolean? P_IsResign, DateTime p_FromDate, DateTime p_ToDate)
        {
            Result<List<Employee>> _Result = new Result<List<Employee>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = (from e in dbContext.EmployeeMasters
                                  join et in dbContext.EmployeeTypeMasters on e.EmployeeTypeId equals et.EmployeeTypeID
                                  join d in dbContext.DepartmentMasters on e.DepartmentId equals d.DepartmentID
                                  join dg in dbContext.DesignationMasters on e.DesignationId equals dg.DesignationID
                                  join g in dbContext.EmployeeGradeMasters on e.EmployeeGradeId equals g.EmployeeGradeID
                                  where e.IsActive == true && et.IsActive == true && d.IsActive == true && dg.IsActive == true && e.JoinDate >= p_FromDate && e.JoinDate < p_ToDate
                                  select new Employee
                                  {
                                      EmployeeID = e.EmployeeID,
                                      EmployeeTypeId = et.EmployeeTypeID,
                                      FirstName = e.FirstName,
                                      MiddleName = e.MiddleName,
                                      LastName = e.LastName,
                                      Email = e.Email,
                                      EmployeeNo = e.EmployeeNo,
                                      EmployeeType = et.EmployeeType,
                                      EmployeeGrade = g.EmployeeGrade,
                                      Department = d.Department,
                                      Designation = dg.Designation,
                                      IsLeave = e.IsLeave,
                                      PFNo = e.PFNo,
                                  });

                    if (!string.IsNullOrEmpty(p_EmployeeTypeId))
                    {
                        Guid _EmployeeTypeId = new Guid(p_EmployeeTypeId);
                        _Query = _Query.Where(x => x.EmployeeTypeId == _EmployeeTypeId);
                    }

                    if (P_IsResign.HasValue)
                    {
                        _Query = _Query.Where(x => x.IsLeave == P_IsResign);
                    }

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

        public Result<Boolean> UpdateEmployeeShift(Guid p_EmployeeId, Guid p_ShiftId, Guid p_UserId)
        {
            Result<Boolean> _Result = new Result<Boolean>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    EmployeeMaster _EmployeeMaster = new EmployeeMaster();

                    if (p_EmployeeId != Guid.Empty)
                    {
                        _EmployeeMaster = dbContext.EmployeeMasters.Where(e => e.EmployeeID == p_EmployeeId).FirstOrDefault();
                        _EmployeeMaster.ShiftId = p_ShiftId;

                        dbContext.SaveChanges();

                        _Result.IsSuccess = true;
                        _Result.Id = Convert.ToString(_EmployeeMaster.EmployeeID);
                        _Result.Data = true;
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

        public Result<DashBoard> GetAdminDashBoard()
        {
            Result<DashBoard> _Result = new Result<DashBoard>();
            try
            {
                _Result.IsSuccess = true;
                _Result.Data = new DashBoard();

                using (var dbContext = new ERPEntities())
                {
                    _Result.Data.TotalEmployee = dbContext.EmployeeMasters.Where(e => e.IsActive == true).Count();
                    _Result.Data.TotalResignEmployee = dbContext.EmployeeMasters.Where(e => e.IsActive == true && e.IsLeave == true).Count();
                    _Result.Data.TotalCurrentEmployee = _Result.Data.TotalEmployee - _Result.Data.TotalResignEmployee;
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

        public Result<DataTable> GetAllEmployees()
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = @"select EmployeeID,REPLACE(FirstName + ' ' + MiddleName + ' ' + LastName, '  ', ' ') as FullName,convert(varchar, JoinDate, 103) JoinDate,
                                Email,MobileNo,ISNULL(is_having_fingureprint,0) as IsFinger,ISNULL(IsHavingFace,0) as IsFace,
                                (select count(EmployeeId) from EmployeeDeviceMap where IsActive=1 and EmployeeId = em.EmployeeID) DeviceCount from EmployeeMaster em where IsActive=1 and IsLeave=0";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeMaster");

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

        public Result<List<Employee>> GetAllSendPendingEmployeeByDevice(Guid p_DeviceId)
        {
            Result<List<Employee>> _Result = new Result<List<Employee>>();
            List<Employee> ListOfEmployee = new List<Employee>();
            Employee _Employee;

            try
            {
                _Result.IsSuccess = false;

                DataTable dataTable = new DataTable();

                string _Query = @"Select EmployeeID,REPLACE(FirstName + ' ' + MiddleName + ' ' + LastName, '  ', ' ') as FullName
                                from EmployeeMaster where IsActive= 1 and IsLeave = 0 and EmployeeID not in (Select EmployeeId from EmployeeDeviceMap where IsActive = 1 and DeviceId = @DeviceId)";

                SqlCommand _SqlCommand = new SqlCommand(_Query);

                _SqlCommand.Parameters.AddWithValue("@DeviceId", Convert.ToString(p_DeviceId));

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "Employee");

                if (_DataSet != null && _DataSet.Tables.Count > 0 && _DataSet.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in _DataSet.Tables[0].Rows)
                    {
                        _Employee = new Employee();
                        _Employee.EmployeeID = new Guid(Convert.ToString(row["EmployeeID"]));
                        _Employee.FullName = Convert.ToString(row["FullName"]);
                        ListOfEmployee.Add(_Employee);
                        _Result.Data = ListOfEmployee;
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

        public Result<bool> SaveEmployeeFingerPrint(Employee p_Employee)
        {
            Result<bool> _Result = new Result<bool>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = @"update EmployeeMaster set FaceTemplateData=@FaceTemplateData, IsHavingFace=@IsHavingFace,FaceLength=@FaceLength,Password=@Password,is_having_fingureprint=@is_having_fingureprint,finger_template_data_tft=@finger_template_data_tft,
                                    finger_template_data_tft1=@finger_template_data_tft1,finger_template_data_tft2=@finger_template_data_tft2,finger_template_data_tft3=@finger_template_data_tft3,finger_template_data_tft4=@finger_template_data_tft4,finger_template_data_tft5=@finger_template_data_tft5,
                                    finger_template_data_tft6=@finger_template_data_tft6,finger_template_data_tft7=@finger_template_data_tft7,finger_template_data_tft8=@finger_template_data_tft8,finger_template_data_tft9=@finger_template_data_tft9 where EmployeeID=@EmployeeID";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@FaceTemplateData", p_Employee.FaceTemplateData);
                _SqlCommand.Parameters.AddWithValue("@IsHavingFace", p_Employee.IsHavingFace);
                _SqlCommand.Parameters.AddWithValue("@FaceLength", p_Employee.FaceLength);
                _SqlCommand.Parameters.AddWithValue("@Password", p_Employee.Password);

                _SqlCommand.Parameters.AddWithValue("@is_having_fingureprint", p_Employee.is_having_fingureprint ?? false);

                if (p_Employee.finger_template_data_tft == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft", p_Employee.finger_template_data_tft);
                }

                if (p_Employee.finger_template_data_tft1 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft1", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft1", p_Employee.finger_template_data_tft1);
                }

                if (p_Employee.finger_template_data_tft2 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft2", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft2", p_Employee.finger_template_data_tft2);
                }

                if (p_Employee.finger_template_data_tft3 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft3", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft3", p_Employee.finger_template_data_tft3);
                }

                if (p_Employee.finger_template_data_tft4 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft4", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft4", p_Employee.finger_template_data_tft4);
                }

                if (p_Employee.finger_template_data_tft5 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft5", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft5", p_Employee.finger_template_data_tft5);
                }

                if (p_Employee.finger_template_data_tft6 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft6", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft6", p_Employee.finger_template_data_tft6);
                }

                if (p_Employee.finger_template_data_tft7 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft7", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft7", p_Employee.finger_template_data_tft7);
                }

                if (p_Employee.finger_template_data_tft8 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft8", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft8", p_Employee.finger_template_data_tft8);
                }

                if (p_Employee.finger_template_data_tft9 == null)
                {
                    _SqlCommand.Parameters.Add("@finger_template_data_tft9", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                }
                else
                {
                    _SqlCommand.Parameters.AddWithValue("@finger_template_data_tft9", p_Employee.finger_template_data_tft9);
                }

                _SqlCommand.Parameters.AddWithValue("@EmployeeID", p_Employee.EmployeeID);

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

        public Result<DataTable> GetAllEmployeeFirstName()
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = "select distinct FirstName from EmployeeMaster where IsActive=1 and IsSend=1";

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeMaster");

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

        public Result<DataTable> GetEmployeeAttendanceReportByEmpoyeeIdAndDate(string p_EmployeeName, DateTime p_FromDate, DateTime p_ToDate, Guid p_DeviceId)
        {
            Result<DataTable> _Result = new Result<DataTable>();
            try
            {
                _Result.IsSuccess = false;

                string _Query = @"select e.EmployeeID,REPLACE(e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName, '  ', ' ') as FullName, ea.AttendanceDate,ea.PunchTime,ea.AttendanceDateTime,ea.PunchMethod,
                                d.DeviceName,ROW_NUMBER() over (PARTITION BY e.EmployeeID,ea.AttendanceDate ORDER BY ea.AttendanceDateTime) AS SrNo from EmployeeMaster e inner join EmployeeAttendanceDevice ea on e.EmployeeID=ea.EmployeeId 
                                inner join DeviceMaster d on ea.DeviceID=d.DeviceID where e.IsActive=1 and ea.IsActive=1 and ea.AttendanceDate>=@FromDate and ea.AttendanceDate<=@ToDate";

                if (!string.IsNullOrEmpty(p_EmployeeName))
                {
                    _Query = _Query + " and e.FirstName like '%" + p_EmployeeName + "%'";
                }

                if (!string.IsNullOrEmpty(Convert.ToString(p_DeviceId)))
                {
                    _Query = _Query + " and d.DeviceID='" + p_DeviceId + "'";
                }

                SqlCommand _SqlCommand = new SqlCommand();
                _SqlCommand.CommandText = _Query;
                _SqlCommand.CommandType = CommandType.Text;

                _SqlCommand.Parameters.AddWithValue("@FromDate", GlobalHelper.DateToString(p_FromDate));
                _SqlCommand.Parameters.AddWithValue("@ToDate", GlobalHelper.DateToString(p_ToDate));

                DataSet _DataSet = SqlDataAccess.RetriveDatabase(_SqlCommand, "EmployeeAttendance");

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

        public Result<List<Employee>> EmployeeUpcomingBirthday()
        {
            Result<List<Employee>> _Result = new Result<List<Employee>>();

            try
            {
                _Result.IsSuccess = false;

                int _Month = DateTime.Now.Month;
                int _Day = DateTime.Now.Day;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = (from e in dbContext.EmployeeMasters
                                  where e.IsActive == true && e.IsLeave == false && e.BirthDate.Value.Month == _Month && e.BirthDate.Value.Day >= _Day
                                  select new Employee
                                  {
                                      EmployeeID = e.EmployeeID,
                                      FirstName = e.FirstName,
                                      LastName = e.LastName,
                                      BirthDate = e.BirthDate ?? DateTime.Now
                                  });

                    _Result.Data = _Query.OrderBy(e=>e.BirthDate.Day).ToList();
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

        public Result<Guid?> GetEmployeeIdByEmployeeNo(int p_EmployeeNo)
        {
            Result<Guid?> _Result = new Result<Guid?>();
            try
            {
                _Result.IsSuccess = false;

                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeMasters
                                 where e.EmployeeNo == p_EmployeeNo
                                 select e.EmployeeID;

                    _Result.IsSuccess = true;
                    _Result.Data = _Query.FirstOrDefault();
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
