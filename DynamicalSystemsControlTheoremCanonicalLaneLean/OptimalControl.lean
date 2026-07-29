import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure OptimalControlPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  costFunctional : (stateSpace → controlSpace → ℝ) → ℝ
  optimalControl : controlSpace
  optimalityCondition : Prop

structure OptimalControlEvidence (O : OptimalControlPackage) where
  optimalityConditionClosed : O.optimalityCondition

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.optimalityCondition

theorem optimal_control_closed_from_evidence (O : OptimalControlPackage)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact E.optimalityConditionClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse