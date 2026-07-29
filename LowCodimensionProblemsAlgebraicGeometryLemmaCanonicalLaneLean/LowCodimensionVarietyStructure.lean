import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure LowCodimensionVariety (k : Type) [Field k] where
  carrier : Set (FiniteTypeAffineScheme k)
  dimension : ℕ
  dimensionBound : dimension ≤ 2
  irreducible : Prop
  reduced : Prop

structure LowCodimensionVarietyPackage (k : Type) [Field k] where
  variety : LowCodimensionVariety k
  codimensionCondition : Prop
  completeIntersection : Prop
  smoothLocusNonempty : Prop
  cohomologyVanishing : Prop

structure LowCodimensionVarietyEvidence {k : Type} [Field k] (P : LowCodimensionVarietyPackage k) where
  codimensionConditionClosed : P.codimensionCondition
  completeIntersectionClosed : P.completeIntersection
  smoothLocusNonemptyClosed : P.smoothLocusNonempty
  cohomologyVanishingClosed : P.cohomologyVanishing

def LowCodimensionVarietyClosed {k : Type} [Field k] (P : LowCodimensionVarietyPackage k) : Prop :=
  P.codimensionCondition ∧ P.completeIntersection ∧ P.smoothLocusNonempty ∧ P.cohomologyVanishing

theorem low_codimension_variety_closed_from_evidence {k : Type} [Field k] (P : LowCodimensionVarietyPackage k) (E : LowCodimensionVarietyEvidence P) : LowCodimensionVarietyClosed P := by
  exact And.intro E.codimensionConditionClosed (And.intro E.completeIntersectionClosed (And.intro E.smoothLocusNonemptyClosed E.cohomologyVanishingClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse