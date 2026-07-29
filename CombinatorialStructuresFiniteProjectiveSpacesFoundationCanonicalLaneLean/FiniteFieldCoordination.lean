import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FiniteFieldCoordinationPackage (P : ProjectiveSpaceAxiomsPackage) where
  field : Type u
  fieldFintype : Fintype field
  fieldIsField : Field field
  vectorSpaceDim : ℕ
  vectorSpace : Type v
  vectorSpaceStructure : Module (field) vectorSpace
  vectorSpaceFintype : Fintype vectorSpace
  coordMap : P.pointSet → Submodule (field) vectorSpace
  coordMapInjective : Function.Injective coordMap
  coordMapCover : Finset.image coordMap (Finset.univ : Finset P.pointSet) = (Finset.filter (λ (v : Submodule (field) vectorSpace) => Submodule.dim v = 1) (Finset.powerset (Finset.univ : Finset vectorSpace))).image id
  lineCoordination : P.lineSet → Submodule (field) vectorSpace
  lineCoordinationImage : ∀ (l : P.lineSet), Submodule.dim (lineCoordination l) = 2
  incidenceToContainment : ∀ (p : P.pointSet) (l : P.lineSet), P.incidence p l ↔ coordMap p ≤ lineCoordination l

structure FiniteFieldCoordinationEvidence (P : ProjectiveSpaceAxiomsPackage)
    (F : FiniteFieldCoordinationPackage P) where
  coordMapInjectiveClosed : F.coordMapInjective
  coordMapCoverClosed : F.coordMapCover
  lineCoordinationImageClosed : F.lineCoordinationImage
  incidenceToContainmentClosed : F.incidenceToContainment

def FiniteFieldCoordinationClosed (P : ProjectiveSpaceAxiomsPackage) (F : FiniteFieldCoordinationPackage P) : Prop :=
  F.coordMapInjective ∧ F.coordMapCover ∧ F.lineCoordinationImage ∧ F.incidenceToContainment

theorem finite_field_coordination_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (F : FiniteFieldCoordinationPackage P) (E : FiniteFieldCoordinationEvidence P F) :
    FiniteFieldCoordinationClosed P F := by
  exact And.intro E.coordMapInjectiveClosed (And.intro E.coordMapCoverClosed
    (And.intro E.lineCoordinationImageClosed E.incidenceToContainmentClosed))

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
