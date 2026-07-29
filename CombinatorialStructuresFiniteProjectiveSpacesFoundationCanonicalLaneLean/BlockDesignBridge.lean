import canonicalLaneMathlib.AdmissibleClass
import CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean.CombinatorialProjectiveStructure

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BlockDesignPackage where
  pointSet : Type u
  blockSet : Type v
  incidence : pointSet → blockSet → Prop
  regularity : Prop
  uniformity : Prop

def BridgeAdmissibleDesign (D : BlockDesignPackage) : Prop :=
  D.regularity ∧ D.uniformity

structure FiniteProjectiveSpaceAdmissibleClass extends AdmissibleClass where
  projectiveSpace : FiniteProjectiveSpace
  designBridge : BridgeAdmissibleDesign ({
    pointSet := projectiveSpace.pointType
    blockSet := projectiveSpace.lineType
    incidence := projectiveSpace.incidence
    regularity := by
      have : Fintype projectiveSpace.pointType := projectiveSpace.finiteness.1
      exact Fintype.card projectiveSpace.pointType > 0
    uniformity := by
      have : Fintype projectiveSpace.lineType := projectiveSpace.finiteness.2
      exact Fintype.card projectiveSpace.lineType > 1
  } : BlockDesignPackage)
  designBridgeTerm : designBridge

def bridgeClosed (A : FiniteProjectiveSpaceAdmissibleClass) : Prop :=
  ProjectiveSpaceClosed A.projectiveSpace

def gateClosed (A : FiniteProjectiveSpaceAdmissibleClass) : Prop :=
  A.designBridge

theorem bridge_from_admissible_class (A : FiniteProjectiveSpaceAdmissibleClass) : bridgeClosed A := by
  exact A.designBridgeTerm

theorem gate_from_admissible_class (A : FiniteProjectiveSpaceAdmissibleClass) : gateClosed A := by
  exact A.designBridgeTerm

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse