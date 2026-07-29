import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure VeblenYoungConfiguration where
  space : FiniteProjectiveSpace
  pointLineIncidence : Prop
  anyTwoPointsDetermineLine : Prop
  paschAxiomEquivalent : Prop
  vehlenYoungConclusion : Prop

structure VeblenYoungEvidence (C : VeblenYoungConfiguration) where
  pointLineIncidenceClosed : C.pointLineIncidence
  anyTwoPointsDetermineLineClosed : C.anyTwoPointsDetermineLine
  paschAxiomEquivalentClosed : C.paschAxiomEquivalent
  vehlenYoungConclusionClosed : C.vehlenYoungConclusion

def VeblenYoungClosed (C : VeblenYoungConfiguration) : Prop :=
  C.pointLineIncidence ∧ C.anyTwoPointsDetermineLine ∧ C.paschAxiomEquivalent ∧ C.vehlenYoungConclusion

theorem vehlen_young_closed_from_evidence (C : VeblenYoungConfiguration) (E : VeblenYoungEvidence C) :
    VeblenYoungClosed C := by
  exact And.intro E.pointLineIncidenceClosed
    (And.intro E.anyTwoPointsDetermineLineClosed
      (And.intro E.paschAxiomEquivalentClosed E.vehlenYoungConclusionClosed))

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse