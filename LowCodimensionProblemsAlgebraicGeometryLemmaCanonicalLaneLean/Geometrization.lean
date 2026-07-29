import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.Surgery

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure GeometrizationPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (U : SurgeryPackage C) where
  finiteStratumAlternative : Prop
  thickThinDecomposition : Prop
  geometrizedStratumClassified : Prop
  lowCodCaseForcesStratumPiece : Prop

structure GeometrizationEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  finiteStratumAlternativeClosed : Z.finiteStratumAlternative
  thickThinDecompositionClosed : Z.thickThinDecomposition
  geometrizedStratumClassifiedClosed : Z.geometrizedStratumClassified
  lowCodCaseForcesStratumPieceClosed : Z.lowCodCaseForcesStratumPiece

def GeometrizationClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) : Prop :=
  Z.finiteStratumAlternative ∧ Z.thickThinDecomposition ∧
  Z.geometrizedStratumClassified ∧ Z.lowCodCaseForcesStratumPiece

theorem geometrization_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} {U : SurgeryPackage C}
    (Z : GeometrizationPackage U) (E : GeometrizationEvidence Z) :
    GeometrizationClosed Z := by
  exact And.intro E.finiteStratumAlternativeClosed
    (And.intro E.thickThinDecompositionClosed
      (And.intro E.geometrizedStratumClassifiedClosed
        E.lowCodCaseForcesStratumPieceClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
