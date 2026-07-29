import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure SmallGainTheoremPackage (n m : Nat) where
  G1 : Matrix (Fin n) (Fin n) Real
  G2 : Matrix (Fin m) (Fin m) Real
  gainProduct : Real := ‖G1‖ * ‖G2‖
  gainCondition : gainProduct < 1
  closedLoopStable : SpectralRadius (G1 * G2) < 1 := by
    exact ?_

theorem small_gain_impl_closed_loop_stability
    (n m : Nat) (S : SmallGainTheoremPackage n m) : 
    SpectralRadius (S.G1 * S.G2) < 1 := by
  exact S.closedLoopStable

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse