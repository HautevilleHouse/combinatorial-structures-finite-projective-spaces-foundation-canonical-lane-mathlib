import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure Oval (q : ℕ) (P : ProjectivePlane q) where
  set : Set P.Point
  cardinal : ℕ
  cardinal_eq_q_plus_one : cardinal = q + 1
  no_three_collinear : ∀ (p1 p2 p3 : P.Point) (l : P.Line), p1 ∈ set → p2 ∈ set → p3 ∈ set →
    (P.incidence p1 l ∧ P.incidence p2 l ∧ P.incidence p3 l) → False

structure OvalStructurePackage (q : ℕ) {P : ProjectivePlane q} (O : Oval q P) where
  ovalAxioms : Prop
  tangentExistence : Prop
  ovalAxiomsTerm : ovalAxioms
  tangentExistenceTerm : tangentExistence

def OvalStructureClosed {q : ℕ} {P : ProjectivePlane q} {O : Oval q P} (S : OvalStructurePackage q O) : Prop :=
  S.ovalAxioms ∧ S.tangentExistence

theorem oval_structure_closed {q : ℕ} {P : ProjectivePlane q} {O : Oval q P} (S : OvalStructurePackage q O) :
    OvalStructureClosed S := by
  exact And.intro S.ovalAxiomsTerm S.tangentExistenceTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
