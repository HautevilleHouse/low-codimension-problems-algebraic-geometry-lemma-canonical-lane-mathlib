import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

structure LefschetzHyperplaneSetup (X : ProjectiveVariety ℂ) (H : Hypersurface) where
  inclusion : H → X
  ambientSmooth : Smooth X
  hypersurfaceSmooth : Smooth H
  codimensionOne : codim H = 1

structure LefschetzHyperplaneTransferPackage {X : ProjectiveVariety ℂ} {H : Hypersurface} (L : LefschetzHyperplaneSetup X H) where
  cohomologyMap : Prop
  weakLefschetz : Prop
  hardLefschetz : Prop
  primitiveDecomposition : Prop

structure LefschetzHyperplaneTransferEvidence {X : ProjectiveVariety ℂ} {H : Hypersurface} {L : LefschetzHyperplaneSetup X H} (T : LefschetzHyperplaneTransferPackage L) where
  cohomologyMapClosed : T.cohomologyMap
  weakLefschetzClosed : T.weakLefschetz
  hardLefschetzClosed : T.hardLefschetz
  primitiveDecompositionClosed : T.primitiveDecomposition

def LefschetzHyperplaneTransferClosed {X : ProjectiveVariety ℂ} {H : Hypersurface} {L : LefschetzHyperplaneSetup X H} (T : LefschetzHyperplaneTransferPackage L) : Prop :=
  T.cohomologyMap ∧ T.weakLefschetz ∧ T.hardLefschetz ∧ T.primitiveDecomposition

theorem lefschetz_hyperplane_transfer_closed_from_evidence {X : ProjectiveVariety ℂ} {H : Hypersurface} {L : LefschetzHyperplaneSetup X H} (T : LefschetzHyperplaneTransferPackage L) (E : LefschetzHyperplaneTransferEvidence T) : LefschetzHyperplaneTransferClosed T := by
  exact And.intro E.cohomologyMapClosed (And.intro E.weakLefschetzClosed (And.intro E.hardLefschetzClosed E.primitiveDecompositionClosed))

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse