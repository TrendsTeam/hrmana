using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class EmployeeDeviceMaps
    {
        public Guid EmployeeDeviceID { get; set; }

        public Guid? EmployeeId { get; set; }

        public Guid? DeviceId { get; set; }

        public string EnrollmentNo { get; set; }

        public DateTime? CreatedDate { get; set; }

        public bool? IsActive { get; set; }

        public Employee Employee { get; set; }

        public Device Device { get; set; }
    }
}
