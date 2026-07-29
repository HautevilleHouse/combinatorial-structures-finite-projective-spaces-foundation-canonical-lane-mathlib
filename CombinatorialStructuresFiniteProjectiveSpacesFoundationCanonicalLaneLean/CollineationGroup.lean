import canonicalLaneMathlib.AdmissibleClass
import Mathlib.GroupTheory.GroupAction.Basic
import Mathlib.GroupTheory.Perm

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure CollineationGroup (q : ℕ) (P : ProjectivePlane q) where
  automorphism : Type u
  group_struct : Group automorphism
  group_action : MulAction automorphism P.Point
  preserves_incidence : ∀ (g : automorphism) (p : P.Point) (l : P.Line), P.incidence p l → P.incidence (g • p) (g • l)

structure CollineationGroupPackage (q : ℕ) {P : ProjectivePlane q} (G : CollineationGroup q P) where
  groupAxioms : Prop
  actionAxioms : Prop
  groupAxiomsTerm : groupAxioms
  actionAxiomsTerm : actionAxioms

def CollineationGroupClosed {q : ℕ} {P : ProjectivePlane q} {G : CollineationGroup q P} (C : CollineationGroupPackage q G) : Prop :=
  C.groupAxioms ∧ C.actionAxioms

theorem collineation_group_closed {q : ℕ} {P : ProjectivePlane q} {G : CollineationGroup q P} (C : CollineationGroupPackage q G) :
    CollineationGroupClosed C := by
  exact And.intro C.groupAxiomsTerm C.actionAxiomsTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
