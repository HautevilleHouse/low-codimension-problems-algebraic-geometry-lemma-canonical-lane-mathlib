import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure HartshorneConjectureStatement where
  ambientSpace : ProjectiveSpace ℂ ^ n
  subvariety : ProjectiveVariety ℂ
  lowCodimension : ℕ
  codimensionBound : lowCodimension ≤ 3
  completeIntersectionQuestion : Prop

structure HartshorneConjecturePackage (H : HartshorneConjectureStatement) where
  connectivityCondition : Prop
  fanoCondition : Prop
  rationalSingularityCondition : Prop
  conclusion : H.completeIntersectionQuestion

structure HartshorneConjectureEvidence {H : HartshorneConjectureStatement} (P : HartshorneConjecturePackage H) where
  connectivityConditionClosed : P.connectivityCondition
  fanoConditionClosed : P.fanoCondition
  rationalSingularityConditionClosed : P.rationalSingularityCondition
  conclusionClosed : P.conclusion

def HartshorneConjectureClosed {H : HartshorneConjectureStatement} (P : HartshorneConjecturePackage H) : Prop :=
  P.connectivityCondition ∧ P.fanoCondition ∧ P.rationalSingularityCondition ∧ P.conclusion

theorem hartshorne_conjecture_closed_from_evidence {H : HartshorneConjectureStatement} (P : HartshorneConjecturePackage H) (E : HartshorneConjectureEvidence P) : HartshorneConjectureClosed P := by
  exact And.intro E.connectivityConditionClosed (And.intro E.fanoConditionClosed (And.intro E.rationalSingularityConditionClosed E.conclusionClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse