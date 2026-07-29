import canonicalLaneMathlib.Noncollapsing

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure LyapunovStabilityPackage {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} (E : EquilibriumPackage F) where
  lyapunovFunction : Type u
  positiveDefinite : Prop
  derivativeNegativeDefinite : Prop
  asymptoticStability : Prop

structure LyapunovStabilityEvidence {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {E : EquilibriumPackage F}
    (L : LyapunovStabilityPackage E) where
  positiveDefiniteClosed : L.positiveDefinite
  derivativeNegativeDefiniteClosed : L.derivativeNegativeDefinite
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovStabilityClosed {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {E : EquilibriumPackage F}
    (L : LyapunovStabilityPackage E) : Prop :=
  L.positiveDefinite ∧ L.derivativeNegativeDefinite ∧ L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence
    {G : DynamicalSystemPackage} {F : ControlSystemPackage G}
    {E : EquilibriumPackage F} (L : LyapunovStabilityPackage E)
    (Ev : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro Ev.positiveDefiniteClosed
    (And.intro Ev.derivativeNegativeDefiniteClosed Ev.asymptoticStabilityClosed)

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse