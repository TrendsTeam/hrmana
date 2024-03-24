using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class EmployeeAttendanceDevices
    {
        public Guid EmployeeAttendanceID { get; set; }

        public Guid? EmployeeId { get; set; }

        public Guid DeviceId { get; set; }

        public string EnrollNo { get; set; }

        public DateTime? AttendanceDate { get; set; }

        public DateTime? AttendanceDateTime { get; set; }

        public string PunchTime { get; set; }

        public string VerifyMethod { get; set; }

        public string PunchMethod { get; set; }

        public DateTime CurrentDate { get; set; }

        public Guid? CreatedBy { get; set; }

        public Guid? ModifiedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool? IsActive { get; set; }

        public string Note { get; set; }

        public string PunchType { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Device Device { get; set; }

        public string FullName { get; set; }

        public string PunchTimes { get; set; }

        public string Email { get; set; }
    }

    public class EmployeeAttendanceResult
    {
        public string AttendanceDateValue { get; set; }

        public string Attendances { get; set; }

        public string Type { get; set; }

        public string Description { get; set; }

        public int AttendanceType { get; set; }
    }
}
