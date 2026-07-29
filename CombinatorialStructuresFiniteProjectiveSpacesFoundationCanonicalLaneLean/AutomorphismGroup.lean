import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Collineation where
  pointMap : pointType → pointType
  lineMap : lineType → lineType
  incidencePreserving : ∀ (p : pointType) (ℓ : lineType), incidence p ℓ ↔ incidence (pointMap p) (lineMap ℓ)
  bijectivePointMap : Function.Bijective pointMap
  bijectiveLineMap : Function.Bijective lineMap

structure ProjectiveGeneralLinearGroup where
  field : FieldOfOrder
  dimension : ℕ
  matrixGroup : Type u
  groupOperation : matrixGroup → matrixGroup → matrixGroup
  groupAxioms : Group matrixGroup
  determinantCondition : ∀ (g : matrixGroup), g.det ≠ 0
  projectiveAction : matrixGroup → Collineation

structure FullAutomorphismGroup where
  collineations : Set Collineation
  groupStructure : Group collineations
  containsAllCollineations : ∀ (c : Collineation), c ∈ collineations
  orderComputation : Fintype.card collineations = (field.finiteOrder^dimension - 1) * ...

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse