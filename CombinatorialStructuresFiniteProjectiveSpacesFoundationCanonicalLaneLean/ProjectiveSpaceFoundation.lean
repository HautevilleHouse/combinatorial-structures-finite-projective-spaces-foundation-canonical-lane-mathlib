import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FiniteProjectiveSpace where
  pointType : Type u
  lineType : Type v
  incidence : pointType → lineType → Prop
  finiteOrder : Nat
  pointsPerLine : Nat
  linesPerPoint : Nat
  orderAxiom : pointsPerLine = finiteOrder + 1 ∧ linesPerPoint = finiteOrder + 1
  anyTwoPointsDetermineLine : ∀ (p q : pointType), p ≠ q → ∃! (ℓ : lineType), incidence p ℓ ∧ incidence q ℓ
  anyTwoLinesIntersect : ∀ (ℓ m : lineType), ℓ ≠ m → ∃! (p : pointType), incidence p ℓ ∧ incidence p m
  atLeastThreePoints : ∃ (p q r : pointType), p ≠ q ∧ p ≠ r ∧ q ≠ r

structure ProjectivePlane where
  space : FiniteProjectiveSpace
  dimension : ℕ := 2
  desarguesProperty : Prop
  pappusProperty : Prop

structure ProjectiveSpaceExtension where
  baseField : Type u
  fieldOrder : ℕ
  vectorSpaceDim : ℕ
  projectiveDimension : ℕ
  fieldAxioms : fieldOrder = baseField.card
  extensionBuilt : Prop

structure ProjectiveAdmittedObject where
  plane : ProjectivePlane
  extension : ProjectiveSpaceExtension
  conclusion : plane.desarguesProperty ∨ plane.pappusProperty

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse