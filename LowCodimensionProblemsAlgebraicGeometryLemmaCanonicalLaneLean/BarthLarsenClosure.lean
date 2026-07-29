import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure BarthLarsenTheorem (X : ProjectiveVariety ℂ) where
  ambientDimension : ℕ
  subvariety : ProjectiveVariety ℂ
  codimension : ℕ
  codimensionCondition : codimension ≤ dim X / 2
  connectivityDegreeBound : Prop
  conclusion : connectivityDegreeBound

structure BarthLarsenPackage (B : BarthLarsenTheorem X) where
  lefschetzHyperplaneCondition : Prop
  effectiveLefschetzCondition : Prop
  cohomologyConstraint : Prop
  conclusionClosed : B.conclusion

structure BarthLarsenEvidence {X : ProjectiveVariety ℂ} {B : BarthLarsenTheorem X} (P : BarthLarsenPackage B) where
  lefschetzHyperplaneConditionClosed : P.lefschetzHyperplaneCondition
  effectiveLefschetzConditionClosed : P.effectiveLefschetzCondition
  cohomologyConstraintClosed : P.cohomologyConstraint
  conclusionClosed : P.conclusionClosed

def BarthLarsenClosed {X : ProjectiveVariety ℂ} {B : BarthLarsenTheorem X} (P : BarthLarsenPackage B) : Prop :=
  P.lefschetzHyperplaneCondition ∧ P.effectiveLefschetzCondition ∧ P.cohomologyConstraint ∧ P.conclusionClosed

theorem barth_larsen_closed_from_evidence {X : ProjectiveVariety ℂ} {B : BarthLarsenTheorem X} (P : BarthLarsenPackage B) (E : BarthLarsenEvidence P) : BarthLarsenClosed P := by
  exact And.intro E.lefschetzHyperplaneConditionClosed (And.intro E.effectiveLefschetzConditionClosed (And.intro E.cohomologyConstraintClosed E.conclusionClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse