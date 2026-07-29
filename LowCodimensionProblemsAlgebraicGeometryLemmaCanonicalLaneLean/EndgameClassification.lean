import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.Geometrization

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure EndgameClassificationPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  targetScheme : Type u
  targetTopology : TopologicalSpace targetScheme
  lowCodimensionClosed : Prop
  universalProperty : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere targetScheme 1
  endpointMatchesLowCodLemma : Prop

structure EndgameClassificationEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (Epkg2 : EndgameClassificationPackage Z) where
  lowCodimensionClosedClosed : Epkg2.lowCodimensionClosed
  endpointMatchesLowCodLemmaClosed : Epkg2.endpointMatchesLowCodLemma

def EndgameClassificationClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (Epkg2 : EndgameClassificationPackage Z) : Prop :=
  Epkg2.lowCodimensionClosed ∧ Epkg2.endpointMatchesLowCodLemma

theorem endgame_classification_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} {U : SurgeryPackage C}
    {Z : GeometrizationPackage U} (Epkg2 : EndgameClassificationPackage Z)
    (E : EndgameClassificationEvidence Epkg2) : EndgameClassificationClosed Epkg2 := by
  exact And.intro E.lowCodimensionClosedClosed E.endpointMatchesLowCodLemmaClosed

theorem endgame_classification_supplies_mathlib_statement
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} {U : SurgeryPackage C}
    {Z : GeometrizationPackage U} (Epkg2 : EndgameClassificationPackage Z) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      Epkg2.targetScheme Epkg2.targetTopology 1 :=
  Epkg2.universalProperty

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
