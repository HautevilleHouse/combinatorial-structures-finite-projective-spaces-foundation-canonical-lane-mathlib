import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure ProjectiveSpaceAxiomsPackage where
  pointSet : Type u
  lineSet : Type v
  incidence : pointSet → lineSet → Prop
  anyTwoPointsUniqueLine : ∀ (p q : pointSet), p ≠ q → ∃! (l : lineSet), incidence p l ∧ incidence q l
  anyTwoLinesUniquePoint : ∀ (l m : lineSet), l ≠ m → ∃! (p : pointSet), incidence p l ∧ incidence p m
  atLeastThreePoints : ∃ (p q r : pointSet), p ≠ q ∧ p ≠ r ∧ q ≠ r
  everyLineHasAtLeastThreePoints : ∀ (l : lineSet), ∃ (p q r : pointSet), p ≠ q ∧ p ≠ r ∧ q ≠ r ∧ incidence p l ∧ incidence q l ∧ incidence r l
  finitePointSet : Fintype pointSet

structure ProjectiveSpaceAxiomsEvidence (P : ProjectiveSpaceAxiomsPackage) where
  anyTwoPointsUniqueLineClosed : P.anyTwoPointsUniqueLine
  anyTwoLinesUniquePointClosed : P.anyTwoLinesUniquePoint
  atLeastThreePointsClosed : P.atLeastThreePoints
  everyLineHasAtLeastThreePointsClosed : P.everyLineHasAtLeastThreePoints
  finitePointSetClosed : Fintype P.pointSet

def ProjectiveSpaceAxiomsClosed (P : ProjectiveSpaceAxiomsPackage) : Prop :=
  P.anyTwoPointsUniqueLine ∧ P.anyTwoLinesUniquePoint ∧ P.atLeastThreePoints ∧ P.everyLineHasAtLeastThreePoints

theorem projective_space_axioms_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (E : ProjectiveSpaceAxiomsEvidence P) : ProjectiveSpaceAxiomsClosed P := by
  exact And.intro E.anyTwoPointsUniqueLineClosed
    (And.intro E.anyTwoLinesUniquePointClosed
      (And.intro E.atLeastThreePointsClosed E.everyLineHasAtLeastThreePointsClosed))

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
