import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean

/-!
# Versal Deformations And Discriminant Package

This module records the versal deformation space and its discriminant locus
for low-codimension singularities. The discriminant captures parameters for
which the singularity changes type.
-/

structure VersalDeformationPackage (P : TjurinaRankPackage) where
  baseSpace : Type u
  totalSpace : Type v
  discriminant : baseSpace → Prop
  versalProperty : Prop
  discriminantExactlyDegenerate : Prop

structure VersalDeformationEvidence {P : TjurinaRankPackage}
    (V : VersalDeformationPackage P) where
  discriminantClosed : V.discriminant
  versalPropertyClosed : V.versalProperty
  discriminantExactlyDegenerateClosed : V.discriminantExactlyDegenerate

def VersalDeformationClosed {P : TjurinaRankPackage}
    (V : VersalDeformationPackage P) : Prop :=
  V.discriminant ∧ V.versalProperty ∧ V.discriminantExactlyDegenerate

theorem versal_deformation_closed_from_evidence {P : TjurinaRankPackage}
    (V : VersalDeformationPackage P) (E : VersalDeformationEvidence V) :
    VersalDeformationClosed V := by
  exact And.intro E.discriminantClosed
    (And.intro E.versalPropertyClosed E.discriminantExactlyDegenerateClosed)

end LowCodimensionProblemsAlgebraicGeometryLemmaCanonicalLaneLean
end HautevilleHouse
