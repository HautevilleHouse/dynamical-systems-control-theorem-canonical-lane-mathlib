import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControllabilityPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  reachableSet : Set stateSpace
  controllabilityConclusion : Prop

structure ControllabilityEvidence (C : ControllabilityPackage) where
  reachableSetClosed : C.reachableSet = Set.univ
  controllabilityConclusionClosed : C.controllabilityConclusion

def ControllabilityClosed (C : ControllabilityPackage) : Prop :=
  (C.reachableSet = Set.univ) ∧ C.controllabilityConclusion

theorem controllability_closed_from_evidence (C : ControllabilityPackage)
    (E : ControllabilityEvidence C) : ControllabilityClosed C := by
  exact And.intro E.reachableSetClosed E.controllabilityConclusionClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse