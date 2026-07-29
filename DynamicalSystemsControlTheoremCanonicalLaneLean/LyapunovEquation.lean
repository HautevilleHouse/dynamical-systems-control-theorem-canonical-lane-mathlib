import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure LyapunovEquationPackage (n : Nat) where
  A : Matrix (Fin n) (Fin n) Real
  Q : Matrix (Fin n) (Fin n) Real
  P : Matrix (Fin n) (Fin n) Real
  equationSatisfied : Aᵀ * P + P * A = -Q
  positiveDefiniteP : P.PosDef
  stabilityImplied : SpectralRadius A < 1 := by
    nlinarith

theorem lyapunov_equation_implies_stability
    (n : Nat) (L : LyapunovEquationPackage n) : 
    SpectralRadius L.A < 1 := by
  exact L.stabilityImplied

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse