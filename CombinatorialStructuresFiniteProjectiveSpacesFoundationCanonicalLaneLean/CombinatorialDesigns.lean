import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Design where
  pointType : Type u
  blockType : Type v
  incidence : pointType → blockType → Prop
  v : ℕ  -- number of points
  b : ℕ  -- number of blocks
  r : ℕ  -- replication number
  k : ℕ  -- block size
  λ : ℕ  -- pairwise balance
  constantBlockSize : ∀ (B : blockType), (∀ p, incidence p B → True) → Finset.card points = k
  pairwiseBalance : ∀ (p q : pointType), p ≠ q → Finset.card {B : blockType | incidence p B ∧ incidence q B} = λ

structure BalancedIncompleteBlockDesign extends Design where
  tDesignProperty : ℕ  -- t-design strength
  tSmallerThanK : tDesignProperty < k
  steinerSystem : λ = 1

structure ProjectivePlaneAsDesign where
  design : BalancedIncompleteBlockDesign
  orderAxiom : design.k = design.v^(1/2) + 1

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse