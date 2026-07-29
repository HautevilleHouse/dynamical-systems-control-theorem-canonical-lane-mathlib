import canonicalLaneMathlib.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DynamicalAdmittedObject where
  space : DynamicalSpace
  controlSystem : Prop
  stabilityCondition : Prop
  attractorModel : Type
  attractorTopology : TopologicalSpace attractorModel
  homeomorphicToAttractor : Prop
  conclusion : homeomorphicToAttractor

structure DynamicalEndgameState where
  object : DynamicalAdmittedObject

def DynamicalWitnessClosed (O : DynamicalAdmittedObject) : Prop :=
  O.homeomorphicToAttractor

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse