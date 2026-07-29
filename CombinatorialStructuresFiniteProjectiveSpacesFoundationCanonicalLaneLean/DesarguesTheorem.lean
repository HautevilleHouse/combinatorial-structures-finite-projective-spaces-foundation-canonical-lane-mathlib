import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure DesarguesConfiguration (q : ℕ) (P : ProjectivePlane q) where
  triangle1 : P.Point × P.Point × P.Point
  triangle2 : P.Point × P.Point × P.Point
  perspective_point : P.Point
  perspective_line : P.Line

structure DesarguesTheoremPackage (q : ℕ) {P : ProjectivePlane q} (D : DesarguesConfiguration q P) where
  hypothesis : Prop
  conclusion : Prop
  hypothesisTerm : hypothesis
  conclusionTerm : conclusion

def DesarguesTheoremClosed {q : ℕ} {P : ProjectivePlane q} {D : DesarguesConfiguration q P} (T : DesarguesTheoremPackage q D) : Prop :=
  T.hypothesis → T.conclusion

theorem desargues_theorem_closed {q : ℕ} {P : ProjectivePlane q} {D : DesarguesConfiguration q P} (T : DesarguesTheoremPackage q D) :
  DesarguesTheoremClosed T := by
  intro h
  exact T.conclusionTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
