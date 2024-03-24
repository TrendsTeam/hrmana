using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class Visit
    {
        public Guid VisitID { get; set; }

        public string FullName { get; set; }

        public int NoOfPerson { get; set; }

        public string EmailAddress { get; set; }

        public string MobileNo { get; set; }

        public string Address { get; set; }

        public string VisitToName { get; set; }

        public string VisitReference { get; set; }

        public string Relation { get; set; }

        public string Purpose { get; set; }

        public DateTime VisitInDateTime { get; set; }

        public DateTime VisitOutDateTime { get; set; }
    }
}
