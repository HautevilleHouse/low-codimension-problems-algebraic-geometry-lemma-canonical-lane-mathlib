import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.RicciFlowPDE

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure ShortTimeExistencePackage {V : AlgebraicVariety} (obj : AdmittedObject) where
  initialRegular : Prop
  wellPosedness : Prop
  localExistence : Prop
  uniqueness : Prop
  smoothDependence : Prop

structure ShortTimeExistenceEvidence {V : AlgebraicVariety} {obj : AdmittedObject} (S : ShortTimeExistencePackage obj) where
  initialRegularClosed : S.initialRegular
  wellPosednessClosed : S.wellPosedness
  localExistenceClosed : S.localExistence
  uniquenessClosed : S.uniqueness
  smoothDependenceClosed : S.smoothDependence

def ShortTimeExistenceClosed {V : AlgebraicVariety} {obj : AdmittedObject} (S : ShortTimeExistencePackage obj) : Prop :=
  S.initialRegular ∧ S.wellPosedness ∧ S.localExistence ∧ S.uniqueness ∧ S.smoothDependence

theorem short_time_existence_closed_from_evidence
    {V : AlgebraicVariety} {obj : AdmittedObject} (S : ShortTimeExistencePackage obj)
    (E : ShortTimeExistenceEvidence S) : ShortTimeExistenceClosed S := by
  exact And.intro E.initialRegularClosed
    (And.intro E.wellPosednessClosed
      (And.intro E.localExistenceClosed
        (And.intro E.uniquenessClosed E.smoothDependenceClosed)))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
