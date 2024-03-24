//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ERP.Dal
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmployeePaidSalary
    {
        public System.Guid EmployeePaidSalaryID { get; set; }
        public System.Guid EmployeeId { get; set; }
        public Nullable<decimal> Basic { get; set; }
        public Nullable<decimal> TotalEarning { get; set; }
        public Nullable<decimal> TotalDeduction { get; set; }
        public Nullable<decimal> TotalSalary { get; set; }
        public Nullable<decimal> PaidBasic { get; set; }
        public Nullable<decimal> PaidTotalEarning { get; set; }
        public Nullable<decimal> PaidTotalDeduction { get; set; }
        public Nullable<decimal> PaidTotalSalary { get; set; }
        public string Month { get; set; }
        public int Year { get; set; }
        public Nullable<decimal> TotalOverTimeDays { get; set; }
        public int TotalDays { get; set; }
        public Nullable<decimal> AllowLeave { get; set; }
        public Nullable<decimal> TotalUseLeave { get; set; }
        public Nullable<decimal> TotalHoliday { get; set; }
        public Nullable<decimal> TotalPaidLeave { get; set; }
        public Nullable<decimal> TotalPaidLeaveAmount { get; set; }
        public Nullable<decimal> TotalOverTimeAmount { get; set; }
        public Nullable<decimal> PaidLoanAmount { get; set; }
        public System.DateTime PaidDate { get; set; }
        public string PaidBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.Guid> ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsPaid { get; set; }
        public System.Guid FinancialYearId { get; set; }
        public Nullable<decimal> TotalPresentDays { get; set; }
        public Nullable<decimal> ProfessionalTax { get; set; }
    
        public virtual EmployeeMaster EmployeeMaster { get; set; }
        public virtual FinancialYearMaster FinancialYearMaster { get; set; }
    }
}
