import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure AsymptoticConsistencyBridgePackage where
  estimatorSequence : ℕ → sampleSpace → parameterSpace
  trueParameter : parameterSpace
  convergenceInProbability : Prop
  rateOfConvergence : ℕ → ℝ
  uniformIntegrability : Prop

structure AsymptoticConsistencyBridgeEvidence (A : AsymptoticConsistencyBridgePackage) where
  convergenceInProbabilityHolds : A.convergenceInProbability
  uniformIntegrabilityHolds : A.uniformIntegrability

Theorem convergenceInProbabilityFromEvidence (A : AsymptoticConsistencyBridgePackage) (ev : AsymptoticConsistencyBridgeEvidence A) : A.convergenceInProbability := ev.convergenceInProbabilityHolds

Theorem uniformIntegrabilityFromEvidence (A : AsymptoticConsistencyBridgePackage) (ev : AsymptoticConsistencyBridgeEvidence A) : A.uniformIntegrability := ev.uniformIntegrabilityHolds

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse