import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure OrderAndDualityPackage (P : ProjectiveSpaceAxiomsPackage) where
  order : ℕ
  orderConsistent : ∀ (l : P.lineSet), Fintype.card {p : P.pointSet | P.incidence p l} = order + 1
  dualSpace : ProjectiveSpaceAxiomsPackage
  dualMap : P.pointSet → dualSpace.lineSet
  dualEvidence : ∀ (p q : P.pointSet), P.incidence p (dualMap q) ↔ dualSpace.incidence (dualMap p) q
  orderClass : order ≥ 2

structure OrderAndDualityEvidence (P : ProjectiveSpaceAxiomsPackage) (O : OrderAndDualityPackage P) where
  orderConsistentClosed : O.orderConsistent
  dualEvidenceClosed : O.dualEvidence
  orderClassClosed : O.orderClass

def OrderAndDualityClosed (P : ProjectiveSpaceAxiomsPackage) (O : OrderAndDualityPackage P) : Prop :=
  O.orderConsistent ∧ O.dualEvidence ∧ O.orderClass

theorem order_and_duality_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (O : OrderAndDualityPackage P) (E : OrderAndDualityEvidence P O) : OrderAndDualityClosed P O := by
  exact And.intro E.orderConsistentClosed (And.intro E.dualEvidenceClosed E.orderClassClosed)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
