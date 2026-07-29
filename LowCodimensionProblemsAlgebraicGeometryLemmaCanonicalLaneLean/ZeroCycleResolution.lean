import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure ZeroCycleSheaf (X : Scheme) where
  zeroCycles : SheafOfAbelianGroups X
  supportDimensionZero : Prop
  torsionFree : Prop

structure ZeroCycleResolutionPackage {X : Scheme} (Z : ZeroCycleSheaf X) where
  resolution : ChainComplex (SheafOfAbelianGroups X) 0 2
  exactnessAt1 : Prop
  exactnessAt2 : Prop
  mapToStructureSheaf : Prop

structure ZeroCycleResolutionEvidence {X : Scheme} {Z : ZeroCycleSheaf X} (R : ZeroCycleResolutionPackage Z) where
  exactnessAt1Closed : R.exactnessAt1
  exactnessAt2Closed : R.exactnessAt2
  mapToStructureSheafClosed : R.mapToStructureSheaf

def ZeroCycleResolutionClosed {X : Scheme} {Z : ZeroCycleSheaf X} (R : ZeroCycleResolutionPackage Z) : Prop :=
  R.exactnessAt1 ∧ R.exactnessAt2 ∧ R.mapToStructureSheaf

theorem zero_cycle_resolution_closed_from_evidence {X : Scheme} {Z : ZeroCycleSheaf X} (R : ZeroCycleResolutionPackage Z) (E : ZeroCycleResolutionEvidence R) : ZeroCycleResolutionClosed R := by
  exact And.intro E.exactnessAt1Closed (And.intro E.exactnessAt2Closed E.mapToStructureSheafClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse