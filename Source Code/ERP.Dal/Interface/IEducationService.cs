using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IEducationService
    {
        Result<List<Education>> GetEducationList();

        Result<Boolean> DeleteEducationById(Guid p_EducationId, Guid p_UserId);

        Result<Education> GetEducationById(Guid p_EducationId);

        Result<Boolean> SaveEducation(Education p_Education, Guid p_UserId);
    }
}
