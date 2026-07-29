import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FiniteProjectiveSpace where
  Point : Type
  Line : Type
  incidence : Point → Line → Prop
  finiteOrder : Nat
  orderAxiom : finiteOrder ≥ 2
  incidenceAxioms : Prop
  veblenYoungAxiom : Prop

structure ProjectiveAdmittedObject where
  space : FiniteProjectiveSpace
  orderPrimePower : Prop
  desarguesian : Prop
  conclusion : desarguesian

structure ProjectiveAdmissibleClass where
  object : ProjectiveAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ProjectiveAdmissibleClass) : Prop :=
  ProjectiveWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse