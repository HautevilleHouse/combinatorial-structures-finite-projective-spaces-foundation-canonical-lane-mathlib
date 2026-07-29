import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FieldOfOrder where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  additiveGroup : AddGroup carrier
  multiplicativeGroup : GroupWithZero carrier
  finiteOrder : ℕ
  fieldOrderAxiom : Fintype.card carrier = finiteOrder

structure VectorSpaceOverField where
  field : FieldOfOrder
  dim : ℕ
  vectorAddition : carrier → carrier → carrier
  scalarMultiplication : field.carrier → carrier → carrier
  vectorSpaceAxioms : Module field.carrier carrier
  dimensionAxiom : Fintype.card carrier = field.finiteOrder^dim

structure ProjectiveSpaceFromVectorSpace where
  field : FieldOfOrder
  vectorSpace : VectorSpaceOverField field
  projectiveDimension : ℕ := vectorSpace.dim - 1
  homogeneousCoordinates : carrier \ {0} / equivalence
  incidence : point → line → Prop
  desarguesHolds : Prop
  fieldCharacteristics : field.finiteOrder.primeFactors ⊆ {2, 3}

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse