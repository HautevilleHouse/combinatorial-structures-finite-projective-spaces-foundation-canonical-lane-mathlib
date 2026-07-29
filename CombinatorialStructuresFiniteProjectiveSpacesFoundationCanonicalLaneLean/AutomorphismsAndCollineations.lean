import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure AutomorphismPackage (P : ProjectiveSpaceAxiomsPackage) where
  group : Type u
  groupStructure : Group group
  action : group → P.pointSet → P.pointSet
  preservesIncidence : ∀ (g : group) (p : P.pointSet) (l : P.lineSet),
    P.incidence p l ↔ P.incidence (action g p) (someActionOnLines g l)
  someActionOnLines : group → P.lineSet → P.lineSet
  collineationSubgroup : Subgroup group
  collineationAction : collineationSubgroup → P.pointSet → P.pointSet
  collineationActionInjective : Function.Injective collineationAction
  collineationSubgroupClosed : Prop

structure AutomorphismEvidence (P : ProjectiveSpaceAxiomsPackage) (A : AutomorphismPackage P) where
  preservesIncidenceClosed : A.preservesIncidence
  collineationActionInjectiveClosed : A.collineationActionInjective
  collineationSubgroupClosedClosed : A.collineationSubgroupClosed

def AutomorphismClosed (P : ProjectiveSpaceAxiomsPackage) (A : AutomorphismPackage P) : Prop :=
  A.preservesIncidence ∧ A.collineationActionInjective ∧ A.collineationSubgroupClosed

theorem automorphism_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (A : AutomorphismPackage P) (E : AutomorphismEvidence P A) : AutomorphismClosed P A := by
  exact And.intro E.preservesIncidenceClosed (And.intro E.collineationActionInjectiveClosed E.collineationSubgroupClosedClosed)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
