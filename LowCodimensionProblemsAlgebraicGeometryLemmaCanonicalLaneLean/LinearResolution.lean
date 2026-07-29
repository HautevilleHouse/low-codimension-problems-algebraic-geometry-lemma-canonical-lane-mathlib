import canonicalLaneMathlib.AdmissibleClass

/-!
# Linear Resolution Package
-/

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure LinearResolutionPackage where
  module : Type u
  ring : Type v
  gradedBettiNumbers : ℕ → ℕ
  linearPart : ℕ → ℕ
  linearSyzygyCondition : ∀ i, gradedBettiNumbers i = linearPart i

def LinearResolutionClosed (L : LinearResolutionPackage) : Prop :=
  ∀ i, L.gradedBettiNumbers i = L.linearPart i

theorem linear_resolution_condition_met (L : LinearResolutionPackage) :
    LinearResolutionClosed L := by
  intro i
  exact L.linearSyzygyCondition i

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
