import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Oval where
  plane : ProjectivePlane
  pointSet : Set pointType
  size : ℕ
  noThreeCollinear : ∀ (p q r : pointType), p ∈ pointSet → q ∈ pointSet → r ∈ pointSet → (p ≠ q ∧ p ≠ r ∧ q ≠ r) → ¬ (∃ ℓ, incidence p ℓ ∧ incidence q ℓ ∧ incidence r ℓ)
  tangentStructure : ∀ (p ∈ pointSet), ∃! ℓ, incidence p ℓ ∧ ℓ ∩ pointSet = {p}

structure Hyperoval extends Oval where
  additionalPoint : pointType
  additionalPointNotInSet : additionalPoint ∉ pointSet
  newSet : Set pointType := pointSet ∪ {additionalPoint}
  newNoThreeCollinear : ∀ (p q r : pointType), p ∈ newSet → q ∈ newSet → r ∈ newSet → (p ≠ q ∧ p ≠ r ∧ q ≠ r) → ¬ (∃ ℓ, incidence p ℓ ∧ incidence q ℓ ∧ incidence r ℓ)

structure Conic where
  field : FieldOfOrder
  conicSet : Set pointType
  quadraticForm : vectorSpace → field.carrier
  zeroSet : {x : vectorSpace | x ≠ 0 ∧ quadraticForm x = 0} / equivalence
  incidenceWithLine : ∀ (ℓ : lineType), ℓ ∩ conicSet ≤ 2
  tangentProperty : In odd characteristic, each point has unique tangent

structure SegreTheorem where
  conic : Conic
  characteristicNotTwo : conic.field.finiteOrder % 2 = 1
  ovalsFromConic : Oval
  classification : Every oval in Desarguesian plane of odd order is a conic

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse