import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.PerelmanRoute

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure DimensionCertificate (obj : AdmittedObject) where
  lowCodimensionCondition : Prop
  dimensionBoundCheck : obj.dimension ≤ 3
  lowCodimensionConditionClosed : lowCodimensionCondition
  dimensionEvidence : NoncollapsingEvidence (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

def DimensionCertificateClosed {obj : AdmittedObject} (D : DimensionCertificate obj) : Prop :=
  D.lowCodimensionCondition ∧ NoncollapsingClosed (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

theorem dimension_certificate_closed {obj : AdmittedObject} (D : DimensionCertificate obj) : DimensionCertificateClosed D := by
  exact And.intro D.lowCodimensionConditionClosed
    (noncollapsing_closed_from_evidence _ D.dimensionEvidence)

structure SmoothnessCertificate (obj : AdmittedObject) where
  smoothVarietyCondition : Prop
  smoothnessConditionCheck : obj.smooth
  smoothVarietyConditionClosed : smoothVarietyCondition
  smoothnessEvidence : NoncollapsingEvidence (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

def SmoothnessCertificateClosed {obj : AdmittedObject} (S : SmoothnessCertificate obj) : Prop :=
  S.smoothVarietyCondition ∧ NoncollapsingClosed (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

theorem smoothness_certificate_closed {obj : AdmittedObject} (S : SmoothnessCertificate obj) : SmoothnessCertificateClosed S := by
  exact And.intro S.smoothVarietyConditionClosed
    (noncollapsing_closed_from_evidence _ S.smoothnessEvidence)

structure ProjectiveCertificate (obj : AdmittedObject) where
  projectiveCondition : Prop
  projectiveConditionCheck : obj.projective
  projectiveConditionClosed : projectiveCondition
  projectiveEvidence : NoncollapsingEvidence (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

def ProjectiveCertificateClosed {obj : AdmittedObject} (P : ProjectiveCertificate obj) : Prop :=
  P.projectiveCondition ∧ NoncollapsingClosed (NoncollapsingPackage.mk obj (by exact obj.codimensionLow) (by exact obj.smooth) (by exact obj.projective) (by trivial) (by trivial))

theorem projective_certificate_closed {obj : AdmittedObject} (P : ProjectiveCertificate obj) : ProjectiveCertificateClosed P := by
  exact And.intro P.projectiveConditionClosed
    (noncollapsing_closed_from_evidence _ P.projectiveEvidence)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
