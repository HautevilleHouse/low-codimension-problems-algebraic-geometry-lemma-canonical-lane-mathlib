import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure LiftingLemmaPackage where
  sheafMorphism : Type u
  liftingCondition : Prop
  lowCodimensionLift : Prop
  conclusion : Prop

structure LiftingLemmaEvidence (L : LiftingLemmaPackage) where
  liftingConditionClosed : L.liftingCondition
  lowCodimensionLiftClosed : L.lowCodimensionLift
  conclusionClosed : L.conclusion

def LiftingLemmaClosed (L : LiftingLemmaPackage) : Prop :=
  L.liftingCondition ∧ L.lowCodimensionLift ∧ L.conclusion

theorem lifting_lemma_closed_from_evidence
    (L : LiftingLemmaPackage) (E : LiftingLemmaEvidence L) :
    LiftingLemmaClosed L := by
  exact And.intro E.liftingConditionClosed
    (And.intro E.lowCodimensionLiftClosed E.conclusionClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse