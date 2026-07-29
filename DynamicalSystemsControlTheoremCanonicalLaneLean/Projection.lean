import DynamicalSystemsControlTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def sysProjection : Projection SysEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem sys_projection_idempotent (x : SysEndgameState) :
    sysProjection.toFun (sysProjection.toFun x) = sysProjection.toFun x := by
  exact sysProjection.idempotent x

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse