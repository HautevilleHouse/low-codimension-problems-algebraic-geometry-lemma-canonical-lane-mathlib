import LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AlgebraicVariety where
  carrier : Type
  topology : TopologicalSpace carrier

structure AdmittedObject where
  variety : AlgebraicVariety
  projective : Prop
  smooth : Prop
  dimension : Nat
  codimensionLow : dimension ≤ 3
  conclusion : Prop

structure EndgameState where
  object : AdmittedObject

def WitnessClosed (O : AdmittedObject) : Prop :=
  O.conclusion

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
