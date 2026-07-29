import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControllabilityReachability (M : ControlSystemModel) where
  reachableSet : Set M.stateSpace
  controllableSet : Set M.stateSpace
  reachableFromInitial : M.stateSpace → Set M.stateSpace
  controllabilityCondition : Prop
  reachabilityCondition : Prop
  controlInputExists : Prop

structure ControllabilityEvidence (M : ControlSystemModel) (C : ControllabilityReachability M) where
  controllabilityConditionClosed : C.controllabilityCondition
  reachabilityConditionClosed : C.reachabilityCondition
  controlInputExistsClosed : C.controlInputExists

def ControllabilityClosed (M : ControlSystemModel) (C : ControllabilityReachability M) : Prop :=
  C.controllabilityCondition ∧ C.reachabilityCondition ∧ C.controlInputExists

theorem controllability_closed_from_evidence (M : ControlSystemModel) (C : ControllabilityReachability M)
    (E : ControllabilityEvidence M C) : ControllabilityClosed M C := by
  exact And.intro E.controllabilityConditionClosed
    (And.intro E.reachabilityConditionClosed E.controlInputExistsClosed)

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse