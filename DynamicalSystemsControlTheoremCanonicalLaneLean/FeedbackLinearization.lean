import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure FeedbackLinearizationPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  outputFunction : stateSpace → ℝ
  lieDerivatives : List (stateSpace → ℝ)
  relativeDegree : Nat
  linearizingControl : controlSpace
  linearizationConclusion : Prop

structure FeedbackLinearizationEvidence (F : FeedbackLinearizationPackage) where
  relativeDegreePositive : F.relativeDegree > 0
  linearizationConclusionClosed : F.linearizationConclusion

def FeedbackLinearizationClosed (F : FeedbackLinearizationPackage) : Prop :=
  (F.relativeDegree > 0) ∧ F.linearizationConclusion

theorem feedback_linearization_closed_from_evidence
    (F : FeedbackLinearizationPackage) (E : FeedbackLinearizationEvidence F) :
    FeedbackLinearizationClosed F := by
  exact And.intro E.relativeDegreePositive E.linearizationConclusionClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse