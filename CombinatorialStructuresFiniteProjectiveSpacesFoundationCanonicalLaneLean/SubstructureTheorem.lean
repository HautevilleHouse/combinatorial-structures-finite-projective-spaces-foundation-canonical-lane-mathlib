import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Subspace where
  pointSet : Set pointType
  isSubspace : ∀ (p q : pointType), p ∈ pointSet → q ∈ pointSet → (∀ r, incidence r (lineThrough p q) → r ∈ pointSet)

structure ProjectiveSubspace extends Subspace where
  containsLine : ∀ (ℓ : lineType), (∃ p q, p ∈ pointSet ∧ q ∈ pointSet ∧ lineThrough p q = ℓ) → (∀ r, incidence r ℓ → r ∈ pointSet)

structure DimensionTheorem where
  space : FiniteProjectiveSpace
  subspaceChain : List ProjectiveSubspace
  dimensionIncreasing : ∀ (i : ℕ), i < subspaceChain.length - 1 → subspaceChain[i+1].pointSet ⊃ subspaceChain[i].pointSet
  maxChainLength : subspaceChain.length = space.finiteOrder + 2

structure IntersectionTheorem where
  subspaces : ProjectiveSubspace × ProjectiveSubspace
  intersectionDimension : ℕ
  formula : dim(subspaces.1.pointSet ∩ subspaces.2.pointSet) + dim(subspaces.1.pointSet ∪ subspaces.2.pointSet) = dim(subspaces.1.pointSet) + dim(subspaces.2.pointSet)

structure VeblenYoungTheorem where
  plane : ProjectivePlane
  desarguesHolds : plane.desarguesProperty
  impliesPappus : plane.pappusProperty ↔ plane.desarguesProperty ∧ plane.order ≠ 2
  characterization : FiniteProjectiveSpace ∧ desarguesHolds → ProjectiveSpaceFromVectorSpace

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse