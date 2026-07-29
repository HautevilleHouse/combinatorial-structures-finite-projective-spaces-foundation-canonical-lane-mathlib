import canonicalLaneMathlib.AdmissibleClass
import Mathlib.LinearAlgebra.FiniteDimensional
import Mathlib.Algebra.Field.Basic

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure FiniteFieldStructure (q : ℕ) where
  order : ℕ
  prime_power : q = order
  field : Type u
  field_struct : Field field
  finite : Fintype field
  order_eq_card : Fintype.card field = order

structure FieldAxiomsPackage (q : ℕ) (FF : FiniteFieldStructure q) where
  fieldAxioms : Prop
  finiteAxiom : Prop
  fieldAxiomsTerm : fieldAxioms
  finiteAxiomTerm : finiteAxiom

def FieldAxiomsClosed {q : ℕ} {FF : FiniteFieldStructure q} (P : FieldAxiomsPackage q FF) : Prop :=
  P.fieldAxioms ∧ P.finiteAxiom

theorem field_axioms_closed {q : ℕ} {FF : FiniteFieldStructure q} (P : FieldAxiomsPackage q FF) :
    FieldAxiomsClosed P := by
  exact And.intro P.fieldAxiomsTerm P.finiteAxiomTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
