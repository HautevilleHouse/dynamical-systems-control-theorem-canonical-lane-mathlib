import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControlLyapunovFunction (X : Type) where
  stateSpace : Type u
  controlInput : Type v
  lyapunovCandidate : stateSpace → ℝ
  lieDerivativeNegative : ∀ x : stateSpace, ∃ u : controlInput, lyapunovCandidate x > 0 ∧ lyapunovCandidate (f x u) < lyapunovCandidate x

structure ControlLyapunovEvidence (X : Type) (V : ControlLyapunovFunction X) where
  lieDerivativeNegativeClosed : V.lieDerivativeNegative

def ControlLyapunovClosed (X : Type) (V : ControlLyapunovFunction X) : Prop :=
  V.lieDerivativeNegative

theorem control_lyapunov_closed_from_evidence (X : Type) (V : ControlLyapunovFunction X)
    (E : ControlLyapunovEvidence X V) : ControlLyapunovClosed X V := by
  exact E.lieDerivativeNegativeClosed

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse