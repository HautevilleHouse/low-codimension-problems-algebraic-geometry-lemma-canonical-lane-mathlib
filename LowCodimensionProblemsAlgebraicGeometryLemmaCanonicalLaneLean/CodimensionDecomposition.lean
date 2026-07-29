import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.SingularityModels

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure CodimensionDecompositionPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) where
  lowCodStratumCovered : Prop
  residualIntersectionDecomposed : Prop
  constructionScaleCompatible : Prop
  decompositionPersistence : Prop

structure CodimensionDecompositionEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (D : CodimensionDecompositionPackage C) where
  lowCodStratumCoveredClosed : D.lowCodStratumCovered
  residualIntersectionDecomposedClosed : D.residualIntersectionDecomposed
  constructionScaleCompatibleClosed : D.constructionScaleCompatible
  decompositionPersistenceClosed : D.decompositionPersistence

def CodimensionDecompositionClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (D : CodimensionDecompositionPackage C) : Prop :=
  D.lowCodStratumCovered ∧ D.residualIntersectionDecomposed ∧
  D.constructionScaleCompatible ∧ D.decompositionPersistence

theorem codimension_decomposition_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} (D : CodimensionDecompositionPackage C)
    (E : CodimensionDecompositionEvidence D) : CodimensionDecompositionClosed D := by
  exact And.intro E.lowCodStratumCoveredClosed
    (And.intro E.residualIntersectionDecomposedClosed
      (And.intro E.constructionScaleCompatibleClosed E.decompositionPersistenceClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
