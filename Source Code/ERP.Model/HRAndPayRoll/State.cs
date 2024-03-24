using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class State
    {
        public Guid StateID { get; set; }

        public string StateName { get; set; }

        public Guid CountryId { get; set; }

        public string CountryName { get; set; }

        public string Code { get; set; }
    }
}
