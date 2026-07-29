import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

/-!
# Frontier Principle Package

This module records the frontier (or boundary) principle for
low-codimension algebraic geometry: the closure of a stratum of
the Tjurina stratification is a union of lower Tjurina-rank strata.
-/

structure FrontierPrinciplePackage (P : TjurinaRankPackage) where
  stratumClosurePreservesStratification : Prop
  lowerTjurinaRankStrataInClosure : Prop
  frontierDimensionDrop : Prop

structure FrontierPrincipleEvidence {P : TjurinaRankPackage}
    (F : FrontierPrinciplePackage P) where
  stratumClosurePreservesStratificationClosed : F.stratumClosurePreservesStratification
  lowerTjurinaRankStrataInClosureClosed : F.lowerTjurinaRankStrataInClosure
  frontierDimensionDropClosed : F.frontierDimensionDrop

def FrontierPrincipleClosed {P : TjurinaRankPackage}
    (F : FrontierPrinciplePackage P) : Prop :=
  F.stratumClosurePreservesStratification ∧ F.lowerTjurinaRankStrataInClosure ∧
  F.frontierDimensionDrop

theorem frontier_principle_closed_from_evidence {P : TjurinaRankPackage}
    (F : FrontierPrinciplePackage P) (E : FrontierPrincipleEvidence F) :
    FrontierPrincipleClosed F := by
  exact And.intro E.stratumClosurePreservesStratificationClosed
    (And.intro E.lowerTjurinaRankStrataInClosureClosed E.frontierDimensionDropClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
