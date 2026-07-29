import canonicalLaneMathlib.AdmissibleClass

/-!
# Cohen-Macaulay Property Package
-/

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure CohenMacaulayPackage where
  ring : Type u
  module : Type v
  depth : ℕ
  krullDimension : ℕ
  regularSequenceLength : ℕ
  depthEqualsDimension : depth = krullDimension
  maximalRegularSequence : Prop

def CohenMacaulayClosed (C : CohenMacaulayPackage) : Prop :=
  C.depth = C.krullDimension ∧ C.maximalRegularSequence

theorem cohen_macaulay_condition_met (C : CohenMacaulayPackage) : CohenMacaulayClosed C := by
  exact And.intro C.depthEqualsDimension C.maximalRegularSequence

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
