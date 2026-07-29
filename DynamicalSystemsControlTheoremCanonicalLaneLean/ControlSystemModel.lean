import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlTheoremCanonicalLaneLean

structure ControlSystemModel where
  stateSpace : Type
  inputSpace : Type
  dynamics : stateSpace → inputSpace → stateSpace
  outputMap : stateSpace → Type
  smoothness : Prop

data OutputSpec where
  stabilization : Prop
  tracking : Prop
  optimality : Prop

theorem smooth_control_system_is_admissible
    (M : ControlSystemModel) (h : M.smoothness) : AdmissibleClass := by
  exact {
    object := {|
      controlModel := M
      smoothProof := h
      conclusion := True
    |}
    endpointSatisfied := True
    remainderRecorded := False
    gateWitness := Or.inl True.intro
  }

end DynamicalSystemsControlTheoremCanonicalLaneLean
end HautevilleHouse