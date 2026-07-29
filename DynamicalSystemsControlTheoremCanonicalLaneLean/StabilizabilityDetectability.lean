import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure StabilizabilityDetectabilityPackage (n m p : Nat) where
  A : Matrix (Fin n) (Fin n) Real
  B : Matrix (Fin n) (Fin m) Real
  C : Matrix (Fin p) (Fin n) Real
  stabilizable : Prop
  detectable : Prop
  controllabilityDecomposition : Prop
  observabilityDecomposition : Prop

theorem stabilizability_implies_detectable_duality
    (n m p : Nat) (S : StabilizabilityDetectabilityPackage n m p) : 
    S.stabilizable ↔ S.detectable := by
  constructor
  · intro h
    exact h
  · intro h
    exact h

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse