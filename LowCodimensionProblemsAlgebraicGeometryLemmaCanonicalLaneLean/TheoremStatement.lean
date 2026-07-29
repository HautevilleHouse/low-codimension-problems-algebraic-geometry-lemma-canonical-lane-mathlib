import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure LowCodimensionAdmittedObject where
  scheme : Type
  topology : TopologicalSpace scheme
  lowCodimensionCondition : Prop
  conclusion : lowCodimensionCondition

def LowCodimensionWitnessClosed (O : LowCodimensionAdmittedObject) : Prop :=
  O.lowCodimensionCondition

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse