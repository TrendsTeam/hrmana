using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Dal.Interface
{
    public interface IStateService
    {
        Result<List<State>> GetStateList();

        Result<Boolean> DeleteStateById(Guid p_StateId, Guid p_UserId);

        Result<State> GetStateById(Guid p_StateId);

        Result<Boolean> SaveState(State p_State, Guid p_UserId);
    }
}
