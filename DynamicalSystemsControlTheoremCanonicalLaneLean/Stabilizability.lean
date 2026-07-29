import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure StabilizabilityPackage (X : Type) where
  controlSystem : ControlLyapunovFunction X
  feedbackLaw : X → controlSystem.controlInput
  closedLoopAsymptoticStability : Prop
  lyapunovFunctionAdmissible : Prop

structure StabilizabilityEvidence (X : Type) (S : StabilizabilityPackage X) where
  closedLoopAsymptoticStabilityClosed : S.closedLoopAsymptoticStability
  lyapunovFunctionAdmissibleClosed : S.lyapunovFunctionAdmissible

def StabilizabilityClosed (X : Type) (S : StabilizabilityPackage X) : Prop :=
  S.closedLoopAsymptoticStability ∧ S.lyapunovFunctionAdmissible

theorem stabilizability_closed_from_evidence (X : Type) (S : StabilizabilityPackage X)
    (E : StabilizabilityEvidence X S) : StabilizabilityClosed X S := by
  exact And.intro E.closedLoopAsymptoticStabilityClosed E.lyapunovFunctionAdmissibleClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse