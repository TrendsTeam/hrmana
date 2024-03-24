using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Model
{
    public class FinancialYear
    {
        public Guid FinancialYearId { get; set; }

        public string FinancialYearText { get; set; }

        public int Year { get; set; }

        public int StartMonth { get; set; }

        public int EndMonth { get; set; }

        public string FinancialMonthText { get; set; }
        
    }
}
