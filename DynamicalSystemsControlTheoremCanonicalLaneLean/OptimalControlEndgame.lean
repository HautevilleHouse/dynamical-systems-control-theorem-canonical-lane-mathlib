import canonicalLaneMathlib.PerelmanAnalyticProof

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure OptimalControlEndgamePackage {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {R : ReachabilityPackage F}
    {L : LyapunovStabilityPackage R} {C : ControllabilityCanonicalFormPackage R}
    (H : HamiltonianPackage C) where
  pontryaginMaximumPrinciple : Prop
  hamiltonJacobiBellmanEquation : Prop
  optimalControlLaw : Prop
  stabilityOptimalityDuality : Prop

structure OptimalControlEndgameEvidence {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {R : ReachabilityPackage F}
    {L : LyapunovStabilityPackage R} {C : ControllabilityCanonicalFormPackage R}
    {H : HamiltonianPackage C} (O : OptimalControlEndgamePackage H) where
  pontryaginMaximumPrincipleClosed : O.pontryaginMaximumPrinciple
  hamiltonJacobiBellmanEquationClosed : O.hamiltonJacobiBellmanEquation
  optimalControlLawClosed : O.optimalControlLaw
  stabilityOptimalityDualityClosed : O.stabilityOptimalityDuality

def OptimalControlEndgameClosed {G : DynamicalSystemPackage}
    {F : ControlSystemPackage G} {R : ReachabilityPackage F}
    {L : LyapunovStabilityPackage R} {C : ControllabilityCanonicalFormPackage R}
    {H : HamiltonianPackage C} (O : OptimalControlEndgamePackage H) : Prop :=
  O.pontryaginMaximumPrinciple ∧ O.hamiltonJacobiBellmanEquation ∧
  O.optimalControlLaw ∧ O.stabilityOptimalityDuality

theorem optimal_control_endgame_closed_from_evidence
    {G : DynamicalSystemPackage} {F : ControlSystemPackage G}
    {R : ReachabilityPackage F} {L : LyapunovStabilityPackage R}
    {C : ControllabilityCanonicalFormPackage R} {H : HamiltonianPackage C}
    (O : OptimalControlEndgamePackage H) (Ev : OptimalControlEndgameEvidence O) :
    OptimalControlEndgameClosed O := by
  exact And.intro Ev.pontryaginMaximumPrincipleClosed
    (And.intro Ev.hamiltonJacobiBellmanEquationClosed
      (And.intro Ev.optimalControlLawClosed Ev.stabilityOptimalityDualityClosed))

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse