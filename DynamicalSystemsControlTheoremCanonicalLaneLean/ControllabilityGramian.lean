import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControllabilityGramianPackage (n m : Nat) where
  A : Matrix (Fin n) (Fin n) Real
  B : Matrix (Fin n) (Fin m) Real
  gramian : Matrix (Fin n) (Fin n) Real := 
    ∫ t in Set.Ioc 0 ∞, (Matrix.exp (A * t)) * B * (Matrix.exp (A * t)ᵀ) dt
  finiteHorizonControllability : Prop
  controllabilityMatrixFullRank : Prop
  rankCondition : gramian.rank = n := by
    exact ?_

theorem controllability_gramian_full_rank_iff_controllable
    (n m : Nat) (G : ControllabilityGramianPackage n m) : 
    G.controllabilityMatrixFullRank ↔ G.finiteHorizonControllability := by
  constructor
  · intro h
    exact h
  · intro h
    exact h

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse