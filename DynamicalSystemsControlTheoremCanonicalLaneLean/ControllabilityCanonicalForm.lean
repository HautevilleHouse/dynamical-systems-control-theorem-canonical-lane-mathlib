import canonicalLaneMathlib.PerelmanAnalyticEvidenceTerms

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControllabilityCanonicalFormPackage {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} (R : ReachabilityPackage F) where
  controllabilityMatrix : Type u
  fullRankCondition : Prop
  reachableSubspace : Prop
  stabilizabilityCondition : Prop

structure ControllabilityCanonicalFormEvidence {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {R : ReachabilityPackage F}
    (C : ControllabilityCanonicalFormPackage R) where
  fullRankConditionClosed : C.fullRankCondition
  reachableSubspaceClosed : C.reachableSubspace
  stabilizabilityConditionClosed : C.stabilizabilityCondition

def ControllabilityCanonicalFormClosed {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {R : ReachabilityPackage F}
    (C : ControllabilityCanonicalFormPackage R) : Prop :=
  C.fullRankCondition ∧ C.reachableSubspace ∧ C.stabilizabilityCondition

theorem controllability_canonical_form_closed_from_evidence
    {G : DynamicalSystemPackage} {F : ControlSystemPackage G}
    {R : ReachabilityPackage F} (C : ControllabilityCanonicalFormPackage R)
    (Ev : ControllabilityCanonicalFormEvidence C) : ControllabilityCanonicalFormClosed C := by
  exact And.intro Ev.fullRankConditionClosed
    (And.intro Ev.reachableSubspaceClosed Ev.stabilizabilityConditionClosed)

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse