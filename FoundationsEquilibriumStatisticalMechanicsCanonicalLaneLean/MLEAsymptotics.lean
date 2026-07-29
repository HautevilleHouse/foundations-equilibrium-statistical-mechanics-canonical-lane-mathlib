import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean.NeymanPearsonLemma

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure MLEAsymptoticsPackage (A : AdmissibleClass) (N : NeymanPearsonPackage A S) where
  parameterSpace : OpenSubset ℝᵈ
  logLikelihood : parameterSpace → ℝ
  trueParameter : parameterSpace
  mleEstimator : sampleSpace → parameterSpace
  consistency : mleEstimator → trueParameter in probability
  asymptoticNormality : √n (mleEstimator - trueParameter) → Normal(0, I⁻¹) in distribution

tructure MLEAsymptoticsEvidence (A : AdmissibleClass) (N : NeymanPearsonPackage A S) (M : MLEAsymptoticsPackage A N) where
  consistencyClosed : M.consistency
  asymptoticNormalityClosed : M.asymptoticNormality

def MLEAsymptoticsClosed (A : AdmissibleClass) (N : NeymanPearsonPackage A S) (M : MLEAsymptoticsPackage A N) : Prop :=
  M.consistency ∧ M.asymptoticNormality

theorem mle_asymptotics_closed_from_evidence (A : AdmissibleClass) (N : NeymanPearsonPackage A S) (M : MLEAsymptoticsPackage A N) (Ev : MLEAsymptoticsEvidence A N M) : MLEAsymptoticsClosed A N M := by
  exact And.intro Ev.consistencyClosed Ev.asymptoticNormalityClosed

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse