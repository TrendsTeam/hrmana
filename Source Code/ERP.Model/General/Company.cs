using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class Company
    {
        public Guid CompanyID { get; set; }

        public string CompanyName { get; set; }

        public string CompanyLogo { get; set; }

        public string EmailAddress { get; set; }

        public Guid CountryId { get; set; }

        public Guid StateId { get; set; }

        public string City { get; set; }

        public string Address { get; set; }

        public string MobileNo { get; set; }

        public string PhoneNo { get; set; }

        public string HotLineNo { get; set; }

        public string FaxNo { get; set; }

        public string WebSite { get; set; }

        public string UserEmailId { get; set; }

        public string UserEmailPassword { get; set; }

        public bool IsEnableSSL { get; set; }

        public string SMTPHost { get; set; }

        public int SMTPPort { get; set; }

        public string FromEmailId { get; set; }

        public string ToEmailId { get; set; }
    }
}
