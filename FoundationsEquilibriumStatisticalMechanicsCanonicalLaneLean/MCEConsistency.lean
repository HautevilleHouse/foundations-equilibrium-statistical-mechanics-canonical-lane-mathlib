import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure MLEAsymptotics where
  sampleSpace : Type u
  parameterSpace : Type v
  logLikelihood : parameterSpace → ℝ
  scoreFunction : parameterSpace → Type w
  fisherInformation : parameterSpace → Type x
  consistencyTheorem : Prop
  asymptoticNormality : Prop
  efficiency : Prop
  consistencyTheoremTerm : consistencyTheorem
  asymptoticNormalityTerm : asymptoticNormality
  efficiencyTerm : efficiency

structure MLEAsymptoticsEvidence (M : MLEAsymptotics) where
  consistencyTheoremClosed : M.consistencyTheorem
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyClosed : M.efficiency

def MLEAsymptoticsClosed (M : MLEAsymptotics) : Prop :=
  M.consistencyTheorem ∧ M.asymptoticNormality ∧ M.efficiency

theorem mle_asymptotics_closed_from_evidence (M : MLEAsymptotics) (E : MLEAsymptoticsEvidence M) : MLEAsymptoticsClosed M := by
  exact And.intro E.consistencyTheoremClosed (And.intro E.asymptoticNormalityClosed E.efficiencyClosed)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse