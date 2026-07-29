import canonicalLaneMathlib.AdmissibleClass

/-!
# Finite Projective Dimension Package
-/

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure FiniteProjectiveDimensionPackage where
  module : Type u
  ring : Type v
  projectiveResolutionLength : ℕ
  finiteLength : projectiveResolutionLength < ∞
  syzygyBoundFinite : Prop

def FiniteProjectiveDimensionClosed (F : FiniteProjectiveDimensionPackage) : Prop :=
  F.projectiveResolutionLength < ∞ ∧ F.syzygyBoundFinite

theorem finite_projective_dimension_condition (F : FiniteProjectiveDimensionPackage) :
    FiniteProjectiveDimensionClosed F := by
  exact And.intro F.finiteLength F.syzygyBoundFinite

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
