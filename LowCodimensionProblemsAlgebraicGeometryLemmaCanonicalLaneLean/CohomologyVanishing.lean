import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure CohomologyVanishingPackage where
  sheaf : Type u
  cohomologyGroups : Nat → Type v
  vanishingCondition : Prop
  application : Prop

structure CohomologyVanishingEvidence (C : CohomologyVanishingPackage) where
  vanishingConditionClosed : C.vanishingCondition
  applicationClosed : C.application

def CohomologyVanishingClosed (C : CohomologyVanishingPackage) : Prop :=
  C.vanishingCondition ∧ C.application

theorem cohomology_vanishing_closed_from_evidence
    (C : CohomologyVanishingPackage) (E : CohomologyVanishingEvidence C) :
    CohomologyVanishingClosed C := by
  exact And.intro E.vanishingConditionClosed E.applicationClosed

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse