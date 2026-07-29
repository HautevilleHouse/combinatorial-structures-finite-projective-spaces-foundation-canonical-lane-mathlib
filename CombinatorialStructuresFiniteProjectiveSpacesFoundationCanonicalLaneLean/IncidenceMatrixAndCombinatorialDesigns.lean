import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean

structure IncidenceMatrixPackage (P : ProjectiveSpaceAxiomsPackage) where
  matrixSize : ℕ × ℕ
  incidenceMatrix : Matrix (Fin (Fintype.card P.pointSet)) (Fin (Fintype.card P.lineSet)) ℕ
  matrixEntry : ∀ (i : Fin (Fintype.card P.pointSet)) (j : Fin (Fintype.card P.lineSet)),
    incidenceMatrix i j = 1 ↔ P.incidence (Fintype.elems (P.pointSet) [i]) (Fintype.elems (P.lineSet) [j])
  symmetricProperty : matrixSize.1 = matrixSize.2
  designParameters : ℕ × ℕ
  balancedIncompleteBlockDesign : (∀ (p : P.pointSet), (Finset.filter (λ (j : Fin (Fintype.card P.lineSet)) =>
    incidenceMatrix (Fintype.elemIdx p) j = 1) (Finset.univ : Finset (Fin (Fintype.card P.lineSet)))).card = designParameters.1)
    ∧ (∀ (l : P.lineSet), (Finset.filter (λ (i : Fin (Fintype.card P.pointSet)) =>
      incidenceMatrix i (Fintype.elemIdx l) = 1) (Finset.univ : Finset (Fin (Fintype.card P.pointSet)))).card = designParameters.2)

structure IncidenceMatrixEvidence (P : ProjectiveSpaceAxiomsPackage) (I : IncidenceMatrixPackage P) where
  matrixEntryClosed : I.matrixEntry
  symmetricPropertyClosed : I.symmetricProperty
  balancedIncompleteBlockDesignClosed : I.balancedIncompleteBlockDesign

def IncidenceMatrixClosed (P : ProjectiveSpaceAxiomsPackage) (I : IncidenceMatrixPackage P) : Prop :=
  I.matrixEntry ∧ I.symmetricProperty ∧ I.balancedIncompleteBlockDesign

theorem incidence_matrix_closed_from_evidence (P : ProjectiveSpaceAxiomsPackage)
    (I : IncidenceMatrixPackage P) (E : IncidenceMatrixEvidence P I) : IncidenceMatrixClosed P I := by
  exact And.intro E.matrixEntryClosed (And.intro E.symmetricPropertyClosed E.balancedIncompleteBlockDesignClosed)

end CombinatorialStructuresFiniteProjectiveSpacesFoundationCanonicalLaneLean
end HautevilleHouse
