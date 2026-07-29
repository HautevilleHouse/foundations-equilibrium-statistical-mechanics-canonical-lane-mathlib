import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure MLEConsistencyPackage where
  parameterSpace : Type u
  sampleSpace : Type v
  iidSamples : ℕ → sampleSpace
  logLikelihood : sampleSpace → parameterSpace → ℝ
  mleEstimator : sampleSpace → parameterSpace
  identifiability : Prop
  compactness : Prop
  continuity : Prop
  consistencyResult : Prop

structure MLEConsistencyEvidence (M : MLEConsistencyPackage) where
  identifiabilityClosed : M.identifiability
  compactnessClosed : M.compactness
  continuityClosed : M.continuity
  consistencyResultClosed : M.consistencyResult

def MLEConsistencyClosed (M : MLEConsistencyPackage) : Prop :=
  M.identifiability ∧ M.compactness ∧ M.continuity ∧ M.consistencyResult

theorem mle_consistency_closed_from_evidence (M : MLEConsistencyPackage) (ev : MLEConsistencyEvidence M) : MLEConsistencyClosed M := by
  exact And.intro ev.identifiabilityClosed (And.intro ev.compactnessClosed (And.intro ev.continuityClosed ev.consistencyResultClosed))

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse