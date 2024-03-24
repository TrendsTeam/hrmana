using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IVisitService
    {
        Result<List<Visit>> GetVisitList();

        Result<Boolean> DeleteVisitById(Guid p_VisitId, Guid p_UserId);

        Result<Visit> GetVisitById(Guid p_VisitId);

        Result<Boolean> SaveVisit(Visit p_Visit, Guid p_UserId);
    }
}
