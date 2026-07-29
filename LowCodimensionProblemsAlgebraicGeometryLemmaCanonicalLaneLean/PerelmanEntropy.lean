import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.ShortTimeExistence

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure PerelmanEntropyPackage {V : AlgebraicVariety} (obj : AdmittedObject) where
  entropyFunctional : Type u
  reducedVolume : Type v
  monotonicityFormula : Prop
  entropyLowerBound : Prop
  vanishingInput : Prop

structure PerelmanEntropyEvidence {V : AlgebraicVariety} {obj : AdmittedObject} (Epkg : PerelmanEntropyPackage obj) where
  monotonicityFormulaClosed : Epkg.monotonicityFormula
  entropyLowerBoundClosed : Epkg.entropyLowerBound
  vanishingInputClosed : Epkg.vanishingInput

def PerelmanEntropyClosed {V : AlgebraicVariety} {obj : AdmittedObject} (Epkg : PerelmanEntropyPackage obj) : Prop :=
  Epkg.monotonicityFormula ∧ Epkg.entropyLowerBound ∧ Epkg.vanishingInput

theorem perelman_entropy_closed_from_evidence
    {V : AlgebraicVariety} {obj : AdmittedObject} (Epkg : PerelmanEntropyPackage obj)
    (E : PerelmanEntropyEvidence Epkg) : PerelmanEntropyClosed Epkg := by
  exact And.intro E.monotonicityFormulaClosed
    (And.intro E.entropyLowerBoundClosed E.vanishingInputClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
