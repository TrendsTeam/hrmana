using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface ICountryService
    {
        Result<List<Country>> GetCountryList();

        Result<Boolean> DeleteCountryById(Guid p_CountryId, Guid p_UserId);

        Result<Country> GetCountryById(Guid p_CountryId);

        Result<Boolean> SaveCountry(Country p_Country, Guid p_UserId);
    }
}
