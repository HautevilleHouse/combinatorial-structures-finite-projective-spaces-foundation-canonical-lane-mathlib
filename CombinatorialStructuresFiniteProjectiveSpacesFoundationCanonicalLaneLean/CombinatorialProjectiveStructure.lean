import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FiniteProjectiveSpace where
  pointType : Type u
  lineType : Type v
  incidence : pointType → lineType → Prop
  finiteness : Fintype pointType × Fintype lineType
  dimension : ℕ
  order : ℕ
  projectivePlaneAxioms : Prop

structure ProjectiveSpaceEvidence (P : FiniteProjectiveSpace) where
  incidenceSymmetric : Prop
  uniqueLineThroughTwoPoints : Prop
  atLeastThreePointsPerLine : Prop
  noFanPlane : Prop

def ProjectiveSpaceClosed (P : FiniteProjectiveSpace) : Prop :=
  P.projectivePlaneAxioms ∧
  (∀ (p q : P.pointType), p ≠ q → ∃! (l : P.lineType), P.incidence p l ∧ P.incidence q l) ∧
  (∀ (l : P.lineType), ∃ (p q r : P.pointType), p ≠ q ∧ q ≠ r ∧ p ≠ r ∧ P.incidence p l ∧ P.incidence q l ∧ P.incidence r l) ∧
  (∀ (l m : P.lineType), ∃ p, P.incidence p l ∧ P.incidence p m)

theorem projective_space_closed_from_evidence (P : FiniteProjectiveSpace) (E : ProjectiveSpaceEvidence P) : ProjectiveSpaceClosed P := by
  sorry

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse