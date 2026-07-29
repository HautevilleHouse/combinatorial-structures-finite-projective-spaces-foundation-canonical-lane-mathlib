import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProjectiveWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse