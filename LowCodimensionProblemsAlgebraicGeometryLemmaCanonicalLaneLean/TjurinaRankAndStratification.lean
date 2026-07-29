import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

/-!
# Tjurina Rank And Stratification Package

This module records the Tjurina rank stratification for low-codimension
singularities. The Tjurina number measures the tangent space to the
deformation functor; its stratification controls the algebraic geometry
of discriminants and equisingularity families.
-/

structure TjurinaRankPackage where
  isolatedSingularityType : Type u
  tjurinaNumber : isolatedSingularityType -> ℕ
  stratification : isolatedSingularityType → Prop
  semicontinuityUnderDeformation : Prop
  genericTjurinaRankNonzero : Prop

structure TjurinaRankEvidence (P : TjurinaRankPackage) where
  stratificationClosed : P.stratification
  semicontinuityUnderDeformationClosed : P.semicontinuityUnderDeformation
  genericTjurinaRankNonzeroClosed : P.genericTjurinaRankNonzero

def TjurinaRankClosed (P : TjurinaRankPackage) : Prop :=
  P.stratification ∧ P.semicontinuityUnderDeformation ∧ P.genericTjurinaRankNonzero

theorem tjurina_rank_closed_from_evidence (P : TjurinaRankPackage)
    (E : TjurinaRankEvidence P) : TjurinaRankClosed P := by
  exact And.intro E.stratificationClosed
    (And.intro E.semicontinuityUnderDeformationClosed E.genericTjurinaRankNonzeroClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
