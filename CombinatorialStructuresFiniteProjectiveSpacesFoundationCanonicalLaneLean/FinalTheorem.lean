import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

def ConstrainedProjectiveSpaceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_projective_space_endgame (A : AdmissibleClass) :
    ConstrainedProjectiveSpaceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
