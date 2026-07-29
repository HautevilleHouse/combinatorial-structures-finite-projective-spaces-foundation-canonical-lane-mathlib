import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure PrimePowerOrderPackage where
  space : FiniteProjectiveSpace
  orderPrimePower : Prop
  isomorphismToDesarguesian : Prop
  classificationComplete : Prop

structure PrimePowerOrderEvidence (P : PrimePowerOrderPackage) where
  orderPrimePowerClosed : P.orderPrimePower
  isomorphismToDesarguesianClosed : P.isomorphismToDesarguesian
  classificationCompleteClosed : P.classificationComplete

def PrimePowerOrderClosed (P : PrimePowerOrderPackage) : Prop :=
  P.orderPrimePower ∧ P.isomorphismToDesarguesian ∧ P.classificationComplete

theorem prime_power_order_closed_from_evidence (P : PrimePowerOrderPackage) (E : PrimePowerOrderEvidence P) :
    PrimePowerOrderClosed P := by
  exact And.intro E.orderPrimePowerClosed
    (And.intro E.isomorphismToDesarguesianClosed E.classificationCompleteClosed)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse