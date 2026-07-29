import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure InformationInequalityPackage where
  parameterSpace : Type u
  family : parameterSpace → (sampleSpace → ℝ)
  fisherInformation : parameterSpace → Matrix ℝ
  cramerRaoLowerBound : Prop
  efficiency : Prop

structure InformationInequalityEvidence (I : InformationInequalityPackage) where
  cramerRaoLowerBoundClosed : I.cramerRaoLowerBound
  efficiencyClosed : I.efficiency

def InformationInequalityClosed (I : InformationInequalityPackage) : Prop :=
  I.cramerRaoLowerBound ∧ I.efficiency

theorem information_inequality_closed_from_evidence (I : InformationInequalityPackage) (ev : InformationInequalityEvidence I) : InformationInequalityClosed I := by
  exact And.intro ev.cramerRaoLowerBoundClosed ev.efficiencyClosed

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse