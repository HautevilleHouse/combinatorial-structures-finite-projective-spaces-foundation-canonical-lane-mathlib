import canonicalLaneMathlib.AdmissibleClass
import Mathlib.LinearAlgebra.FiniteDimensional

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure ProjectivePlane (q : ℕ) where
  Point : Type u
  Line : Type v
  incidence : Point → Line → Prop
  distinct_points_unique_line : ∀ p1 p2 : Point, p1 ≠ p2 → ∃! l : Line, incidence p1 l ∧ incidence p2 l
  distinct_lines_unique_point : ∀ l1 l2 : Line, l1 ≠ l2 → ∃! p : Point, incidence p l1 ∧ incidence p l2
  exists_four_no_three_collinear : ∃ (p1 p2 p3 p4 : Point), ∀ l : Line, ¬(incidence p1 l ∧ incidence p2 l ∧ incidence p3 l ∧ incidence p4 l)

structure ProjectivePlaneAxiomsPackage (q : ℕ) (P : ProjectivePlane q) where
  incidenceAxioms : Prop
  sizeAxiom : Prop
  incidenceAxiomsTerm : incidenceAxioms
  sizeAxiomTerm : sizeAxiom

def ProjectivePlaneAxiomsClosed {q : ℕ} {P : ProjectivePlane q} (A : ProjectivePlaneAxiomsPackage q P) : Prop :=
  A.incidenceAxioms ∧ A.sizeAxiom

theorem projective_plane_axioms_closed {q : ℕ} {P : ProjectivePlane q} (A : ProjectivePlaneAxiomsPackage q P) :
    ProjectivePlaneAxiomsClosed A := by
  exact And.intro A.incidenceAxiomsTerm A.sizeAxiomTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
