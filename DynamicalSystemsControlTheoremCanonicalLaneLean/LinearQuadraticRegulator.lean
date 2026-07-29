import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure LinearQuadraticRegulatorPackage (n m : Nat) where
  A : Matrix (Fin n) (Fin n) Real
  B : Matrix (Fin n) (Fin m) Real
  Q : Matrix (Fin n) (Fin n) Real
  R : Matrix (Fin m) (Fin m) Real
  K : Matrix (Fin m) (Fin n) Real
  closedLoopStable : SpectralRadius (A - B * K) < 1
  optimalCost : Real

theorem lqr_optimal_controller
    (n m : Nat) (L : LinearQuadraticRegulatorPackage n m) : 
    isOptimal L.K := by
  exact L.closedLoopStable

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse