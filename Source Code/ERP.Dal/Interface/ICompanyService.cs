using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface ICompanyService
    {   
        Result<Company> GetCompany();

        Result<Boolean> SaveCompany(Company p_Company, Guid p_UserId);

    }
}
