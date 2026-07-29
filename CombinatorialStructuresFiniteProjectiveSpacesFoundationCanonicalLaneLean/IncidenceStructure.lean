import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure IncidenceStructure where
  pointType : Type u
  blockType : Type v
  incidence : pointType → blockType → Prop
  nonEmpty : Nonempty pointType
  nonDegenerate : ∃ (p : pointType) (B : blockType), ¬ incidence p B

structure LinearSpace extends IncidenceStructure where
  anyTwoPointsUniqueBlock : ∀ (p q : pointType), p ≠ q → ∃! (B : blockType), incidence p B ∧ incidence q B
  atLeastTwoPoints : ∃ (p q : pointType), p ≠ q

structure ProjectivePlaneFromLinear extends LinearSpace where
  anyTwoBlocksUniquePoint : ∀ (B C : blockType), B ≠ C → ∃! (p : pointType), incidence p B ∧ incidence p C
  atLeastThreePoints : ∃ (p q r : pointType), p ≠ q ∧ p ≠ r ∧ q ≠ r

structure ProjectivePlaneFoundation where
  plane : ProjectivePlaneFromLinear
  order : ℕ
  orderAxiom : order ≥ 2
  pointsCount : order^2 + order + 1
  linesCount : order^2 + order + 1

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse