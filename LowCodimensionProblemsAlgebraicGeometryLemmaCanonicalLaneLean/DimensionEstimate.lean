import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure DimensionEstimatePackage where
  scheme : Type u
  codimensionBound : Nat
  dimensionInequality : Prop
  conclusion : Prop

structure DimensionEstimateEvidence (D : DimensionEstimatePackage) where
  dimensionInequalityClosed : D.dimensionInequality
  conclusionClosed : D.conclusion

def DimensionEstimateClosed (D : DimensionEstimatePackage) : Prop :=
  D.dimensionInequality ∧ D.conclusion

theorem dimension_estimate_closed_from_evidence
    (D : DimensionEstimatePackage) (E : DimensionEstimateEvidence D) :
    DimensionEstimateClosed D := by
  exact And.intro E.dimensionInequalityClosed E.conclusionClosed

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse