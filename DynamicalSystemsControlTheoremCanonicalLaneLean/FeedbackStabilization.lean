import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure FeedbackStabilization (M : ControlSystemModel) where
  equilibrium : M.stateSpace
  feedbackLaw : M.stateSpace → M.inputSpace
  closedLoopDynamics : M.stateSpace → M.stateSpace
  asymptoticStability : Prop
  stabilityRate : Prop

structure FeedbackStabilizationEvidence (M : ControlSystemModel) (F : FeedbackStabilization M) where
  asymptoticStabilityClosed : F.asymptoticStability
  stabilityRateClosed : F.stabilityRate

def FeedbackStabilizationClosed (M : ControlSystemModel) (F : FeedbackStabilization M) : Prop :=
  F.asymptoticStability ∧ F.stabilityRate

theorem feedback_stabilization_closed_from_evidence (M : ControlSystemModel) (F : FeedbackStabilization M)
    (E : FeedbackStabilizationEvidence M F) : FeedbackStabilizationClosed M F := by
  exact And.intro E.asymptoticStabilityClosed E.stabilityRateClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse