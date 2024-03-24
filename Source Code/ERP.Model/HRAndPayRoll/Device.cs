using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class Device
    {
        public Guid? DeviceID { get; set; }

        public string DeviceName { get; set; }

        public string Address { get; set; }

        public string DeviceCode { get; set; }

        public string PhoneNo { get; set; }

        public string Port { get; set; }

        public string IPAddress { get; set; }
    }
}
