import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure DimensionEvidenceTerms {obj : AdmittedObject} (D : DimensionCertificate obj) where
  lowCodimensionCondition : D.lowCodimensionCondition
  dimensionClosed : AdmittedWitnessClosed obj

def DimensionCertificate.evidenceTerms {obj : AdmittedObject} (D : DimensionCertificate obj) : DimensionEvidenceTerms D :=
  {
    lowCodimensionCondition := D.lowCodimensionConditionClosed
    dimensionClosed := dimension_closed_from_evidence obj D.dimensionEvidence
  }

structure SmoothnessEvidenceTerms {obj : AdmittedObject} (S : SmoothnessCertificate obj) where
  smoothVarietyCondition : S.smoothVarietyCondition
  smoothnessClosed : AdmittedWitnessClosed obj

def SmoothnessCertificate.evidenceTerms {obj : AdmittedObject} (S : SmoothnessCertificate obj) : SmoothnessEvidenceTerms S :=
  {
    smoothVarietyCondition := S.smoothVarietyConditionClosed
    smoothnessClosed := smoothness_closed_from_evidence obj S.smoothnessEvidence
  }

structure ProjectiveEvidenceTerms {obj : AdmittedObject} (P : ProjectiveCertificate obj) where
  projectiveCondition : P.projectiveCondition
  projectiveClosed : AdmittedWitnessClosed obj

def ProjectiveCertificate.evidenceTerms {obj : AdmittedObject} (P : ProjectiveCertificate obj) : ProjectiveEvidenceTerms P :=
  {
    projectiveCondition := P.projectiveConditionClosed
    projectiveClosed := projective_closed_from_evidence obj P.projectiveEvidence
  }

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
