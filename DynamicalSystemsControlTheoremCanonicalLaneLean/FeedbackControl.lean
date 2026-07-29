import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure FeedbackControlPackage {X : Type} (S : StabilizabilityPackage X) where
  feedbackSynthesis : Prop
  robustnessMargins : Prop
  optimalCostFunctional : Prop

structure FeedbackControlEvidence {X : Type} {S : StabilizabilityPackage X}
    (F : FeedbackControlPackage S) where
  feedbackSynthesisClosed : F.feedbackSynthesis
  robustnessMarginsClosed : F.robustnessMargins
  optimalCostFunctionalClosed : F.optimalCostFunctional

def FeedbackControlClosed {X : Type} {S : StabilizabilityPackage X}
    (F : FeedbackControlPackage S) : Prop :=
  F.feedbackSynthesis ∧ F.robustnessMargins ∧ F.optimalCostFunctional

theorem feedback_control_closed_from_evidence {X : Type} {S : StabilizabilityPackage X}
    (F : FeedbackControlPackage S) (E : FeedbackControlEvidence F) :
    FeedbackControlClosed F := by
  exact And.intro E.feedbackSynthesisClosed
    (And.intro E.robustnessMarginsClosed E.optimalCostFunctionalClosed)

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse