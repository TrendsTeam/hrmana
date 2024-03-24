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
    public class LookupService : ILookupService
    {
        public Result<List<Item>> GetAllFinancialYear()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from f in dbContext.FinancialYearMasters
                                 where f.IsActive == true
                                 orderby f.Year
                                 select new Item
                                 {
                                     Id = f.FinancialYearID,
                                     Text = f.FinancialYear
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

        public Result<List<Item>> GetAllEmployeeByDepartmentId(Guid p_DepartmentId)
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeMasters
                                 where e.DepartmentId == p_DepartmentId && e.IsActive == true
                                 select new Item
                                 {
                                     Id = e.EmployeeID,
                                     Text = e.FirstName + " " + e.LastName
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

        public Result<List<Item>> GetAllActiveEmployeeByDepartmentId(Guid p_DepartmentId)
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeMasters
                                 where (p_DepartmentId == Guid.Empty ? true : e.DepartmentId == p_DepartmentId) && e.IsActive == true && e.IsLeave == false
                                 select new Item
                                 {
                                     Id = e.EmployeeID,
                                     Text = e.FirstName + " " + e.LastName
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

        public Result<List<Item>> GetAllCountry()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from c in dbContext.CountryMasters
                                 where c.IsActive == true
                                 orderby c.CountryName
                                 select new Item
                                 {
                                     Id = c.CountryID,
                                     Text = c.CountryName
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

        public Result<List<Item>> GetAllStateByCountryId(Guid p_CountryId)
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from s in dbContext.StateMasters
                                 where s.CountryId == p_CountryId && s.IsActive == true
                                 orderby s.StateName
                                 select new Item
                                 {
                                     Id = s.StateID,
                                     Text = s.StateName
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

        public Result<List<Item>> GetAllEmployeeType()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeTypeMasters
                                 where e.IsActive == true
                                 orderby e.EmployeeType
                                 select new Item
                                 {
                                     Id = e.EmployeeTypeID,
                                     Text = e.EmployeeType
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

        public Result<List<Item>> GetAllDepartment()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from d in dbContext.DepartmentMasters
                                 where d.IsActive == true
                                 orderby d.Department
                                 select new Item
                                 {
                                     Id = d.DepartmentID,
                                     Text = d.Department
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

        public Result<List<Item>> GetAllDesignation()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from d in dbContext.DesignationMasters
                                 where d.IsActive == true
                                 orderby d.Designation
                                 select new Item
                                 {
                                     Id = d.DesignationID,
                                     Text = d.Designation
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

        public Result<List<Item>> GetAllEmployeeGrade()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeGradeMasters
                                 where e.IsActive == true
                                 orderby e.EmployeeGrade
                                 select new Item
                                 {
                                     Id = e.EmployeeGradeID,
                                     Text = e.EmployeeGrade
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

        public Result<List<Item>> GetAllShift()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from s in dbContext.ShiftMasters
                                 where s.IsActive == true
                                 orderby s.Shift
                                 select new Item
                                 {
                                     Id = s.ShiftID,
                                     Text = s.Shift + " " + s.FromTime + " - " + s.ToTime,
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

        public Result<List<Item>> GetAllUnAssignSalaryEmployeeByDepartmentId(Guid p_DepartmentId)
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = (from e in dbContext.EmployeeMasters
                                  where e.IsActive == true && e.DepartmentId == p_DepartmentId && e.EmployeeSalaries.Count() == 0
                                  select new Item
                                  {
                                      Id = e.EmployeeID,
                                      Text = e.FirstName + " " + e.LastName,
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

        public Result<List<Item>> GetAllLeaveCategory()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from l in dbContext.LeaveCategoryMasters
                                 where l.IsActive == true
                                 orderby l.LeaveCategory
                                 select new Item
                                 {
                                     Id = l.LeaveCategoryID,
                                     Text = l.LeaveCategory,
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

        public Result<List<Dashboard>> GetSalaryChartDetailsByEmployeeId(Guid p_EmployeeId, Guid p_FinancialYearId)
        {
            Result<List<Dashboard>> _Result = new Result<List<Dashboard>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeePaidSalaries
                                 where e.EmployeeId == p_EmployeeId && e.FinancialYearId== p_FinancialYearId && e.IsActive == true orderby e.PaidDate
                                 select new Dashboard
                                 {
                                     Month = e.Month,
                                     PaidTotalSalary= e.PaidTotalSalary ?? 0,
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

        public Result<List<Item>> GetAllActiveEmployee()
        {
            Result<List<Item>> _Result = new Result<List<Item>>();

            try
            {
                _Result.IsSuccess = false;
                using (var dbContext = new ERPEntities())
                {
                    var _Query = from e in dbContext.EmployeeMasters
                                 where e.IsActive == true && e.IsLeave == false
                                 select new Item
                                 {
                                     Id = e.EmployeeID,
                                     Text = e.FirstName + " " + e.LastName
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
    }
}
