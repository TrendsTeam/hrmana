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
    
    public partial class EmployeeDeductionMap
    {
        public System.Guid EmployeeDeductionMapID { get; set; }
        public System.Guid EmployeeId { get; set; }
        public System.Guid DeductionId { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.Guid> ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public bool IsActive { get; set; }
    
        public virtual DeductionMaster DeductionMaster { get; set; }
        public virtual EmployeeMaster EmployeeMaster { get; set; }
    }
}
