import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure MLEBridgePackage where
  sampleSpace : Type u
  parameterSpace : Type v
  likelihood : sampleSpace → parameterSpace → ℝ
  maxLikelihoodEstimator : sampleSpace → parameterSpace
  consistencyProperty : Prop
  asymptoticNormalityProperty : Prop
  convergenceRate : ℝ
  regularityConditions : Prop

structure MLEBridgeEvidence (M : MLEBridgePackage) where
  consistencyHolds : M.consistencyProperty
  asymptoticNormalityHolds : M.asymptoticNormalityProperty
  regularityConditionsHolds : M.regularityConditions

theorem consistencyFromEvidence (M : MLEBridgePackage) (ev : MLEBridgeEvidence M) : M.consistencyProperty := ev.consistencyHolds

theorem asymptoticNormalityFromEvidence (M : MLEBridgePackage) (ev : MLEBridgeEvidence M) : M.asymptoticNormalityProperty := ev.asymptoticNormalityHolds

theorem regularityFromEvidence (M : MLEBridgePackage) (ev : MLEBridgeEvidence M) : M.regularityConditions := ev.regularityConditionsHolds

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse