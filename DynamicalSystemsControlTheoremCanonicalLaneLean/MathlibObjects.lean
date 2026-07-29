import DynamicalSystemsControlTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SysSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SysAdmittedObject where
  space : SysSpace
  isControlSystem : Prop
  isStabilizable : Prop
  targetSet : Type
  targetTopology : TopologicalSpace targetSet
  reachable : Prop
  conclusion : reachable

structure SysEndgameState where
  object : SysAdmittedObject

def SysWitnessClosed (O : SysAdmittedObject) : Prop :=
  O.reachable

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse