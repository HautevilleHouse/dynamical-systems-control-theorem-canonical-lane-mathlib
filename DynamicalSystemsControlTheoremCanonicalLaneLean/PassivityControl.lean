import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure PassivityControlPackage where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → inputSpace → stateSpace
  outputMap : stateSpace → outputSpace
  storageFunction : stateSpace → ℝ
  passivityInequality : Prop
  passivityConclusion : Prop

structure PassivityControlEvidence (P : PassivityControlPackage) where
  storageFunctionNonnegative : ∀ x, P.storageFunction x ≥ 0
  passivityInequalityClosed : P.passivityInequality
  passivityConclusionClosed : P.passivityConclusion

def PassivityControlClosed (P : PassivityControlPackage) : Prop :=
  (∀ x, P.storageFunction x ≥ 0) ∧ P.passivityInequality ∧ P.passivityConclusion

theorem passivity_control_closed_from_evidence (P : PassivityControlPackage)
    (E : PassivityControlEvidence P) : PassivityControlClosed P := by
  exact And.intro E.storageFunctionNonnegative
    (And.intro E.passivityInequalityClosed E.passivityConclusionClosed)

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse