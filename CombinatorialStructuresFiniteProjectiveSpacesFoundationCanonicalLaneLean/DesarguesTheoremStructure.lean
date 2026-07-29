import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure DesarguesConfiguration where
  space : FiniteProjectiveSpace
  trianglesArePerspective : Prop
  axisIntersectionPointsCollinear : Prop
  desarguesianConclusion : Prop

structure DesarguesEvidence (C : DesarguesConfiguration) where
  trianglesArePerspectiveClosed : C.trianglesArePerspective
  axisIntersectionPointsCollinearClosed : C.axisIntersectionPointsCollinear
  desarguesianConclusionClosed : C.desarguesianConclusion

def DesarguesClosed (C : DesarguesConfiguration) : Prop :=
  C.trianglesArePerspective ∧ C.axisIntersectionPointsCollinear ∧ C.desarguesianConclusion

theorem desargues_closed_from_evidence (C : DesarguesConfiguration) (E : DesarguesEvidence C) :
    DesarguesClosed C := by
  exact And.intro E.trianglesArePerspectiveClosed
    (And.intro E.axisIntersectionPointsCollinearClosed E.desarguesianConclusionClosed)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse