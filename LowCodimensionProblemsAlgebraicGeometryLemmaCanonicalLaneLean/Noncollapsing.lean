import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.PerelmanEntropy

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure NoncollapsingPackage {V : AlgebraicVariety} (obj : AdmittedObject) where
  dimensionConstraint : obj.dimension ≤ 3
  smoothnessCondition : obj.smooth
  projectiveCondition : obj.projective
  localCompleteIntersection : Prop
  vanishingCondition : Prop

structure NoncollapsingEvidence {V : AlgebraicVariety} {obj : AdmittedObject} (N : NoncollapsingPackage obj) where
  dimensionConstraintClosed : N.dimensionConstraint
  smoothnessConditionClosed : N.smoothnessCondition
  projectiveConditionClosed : N.projectiveCondition
  localCompleteIntersectionClosed : N.localCompleteIntersection
  vanishingConditionClosed : N.vanishingCondition

def NoncollapsingClosed {V : AlgebraicVariety} {obj : AdmittedObject} (N : NoncollapsingPackage obj) : Prop :=
  N.dimensionConstraint ∧ N.smoothnessCondition ∧ N.projectiveCondition ∧ N.localCompleteIntersection ∧ N.vanishingCondition

theorem noncollapsing_closed_from_evidence
    {V : AlgebraicVariety} {obj : AdmittedObject} (N : NoncollapsingPackage obj) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.dimensionConstraintClosed
    (And.intro E.smoothnessConditionClosed
      (And.intro E.projectiveConditionClosed
        (And.intro E.localCompleteIntersectionClosed E.vanishingConditionClosed)))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
