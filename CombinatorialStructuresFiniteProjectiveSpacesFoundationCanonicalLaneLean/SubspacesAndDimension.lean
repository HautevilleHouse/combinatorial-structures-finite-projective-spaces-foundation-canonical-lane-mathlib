import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Subspace (P : ProjectiveSpaceAxiomsPackage) where
  pointSet : Set P.pointSet
  subspaceClosure : ∀ (p q : P.pointSet), p ∈ pointSet → q ∈ pointSet →
    (∀ (l : P.lineSet), P.incidence p l ∧ P.incidence q l → ∀ (r : P.pointSet), P.incidence r l → r ∈ pointSet)

structure SubspacesAndDimensionPackage (P : ProjectiveSpaceAxiomsPackage) where
  dimension : ℕ
  subspaceLattice : Finset (Subspace P)
  flagMaxLength : ℕ
  dimensionConsistent : ∃ (chain : List (Subspace P)),
    (∀ i < chain.length - 1, chain.get? i |>.map (·.pointSet) < chain.get? (i+1) |>.map (·.pointSet))
    ∧ chain.length = dimension + 2
  subspaceLatticeClosed : Prop

def SubspacesAndDimensionClosed (P : ProjectiveSpaceAxiomsPackage) (S : SubspacesAndDimensionPackage P) : Prop :=
  S.dimensionConsistent ∧ S.subspaceLatticeClosed

theorem subspaces_and_dimension_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (S : SubspacesAndDimensionPackage P) (h : S.dimensionConsistent) (h' : S.subspaceLatticeClosed) :
    SubspacesAndDimensionClosed P S := by
  exact And.intro h h'

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
