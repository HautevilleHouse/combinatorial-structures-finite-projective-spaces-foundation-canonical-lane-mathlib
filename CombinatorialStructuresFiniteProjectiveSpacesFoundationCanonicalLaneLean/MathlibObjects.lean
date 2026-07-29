import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Combinatorics.FiniteProjectivePlane.Basic

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure ProjectiveSpace where
  carrier : Type
  incidence : carrier → carrier → Prop
  finite : Finset carrier

structure ProjectiveAdmittedObject where
  space : ProjectiveSpace
  order : ℕ
  desarguesian : Prop
  conclusion : desarguesian

structure ProjectiveEndgameState where
  object : ProjectiveAdmittedObject

def ProjectiveWitnessClosed (O : ProjectiveAdmittedObject) : Prop :=
  O.desarguesian

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse