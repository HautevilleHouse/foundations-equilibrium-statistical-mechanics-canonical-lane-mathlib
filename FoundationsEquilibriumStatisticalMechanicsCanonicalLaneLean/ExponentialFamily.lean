import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure ExponentialFamilyPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  parameterSpace : Type v
  sufficientStatistic : sampleSpace → parameterSpace
  baseMeasure : sampleSpace → ℝ
  logPartition : parameterSpace → ℝ
  carrierFamily : parameterSpace → (sampleSpace → ℝ) := λ θ x => baseMeasure x * Real.exp (sufficientStatistic x • θ - logPartition θ)
  dominatedFamily : Prop
  carrierFamilyClosed : carrierFamily = λ θ x => baseMeasure x * Real.exp (sufficientStatistic x • θ - logPartition θ)
  exponentialFormValid : Prop
  parameterSpaceConvex : Prop
  logPartitionFinite : Prop

structure ExponentialFamilyEvidence (E : ExponentialFamilyPackage) where
  dominatedFamilyClosed : E.dominatedFamily
  exponentialFormValidClosed : E.exponentialFormValid
  parameterSpaceConvexClosed : E.parameterSpaceConvex
  logPartitionFiniteClosed : E.logPartitionFinite

def ExponentialFamilyClosed (E : ExponentialFamilyPackage) : Prop :=
  E.dominatedFamily ∧ E.exponentialFormValid ∧ E.parameterSpaceConvex ∧ E.logPartitionFinite

theorem exponential_family_closed_from_evidence (E : ExponentialFamilyPackage) (Ev : ExponentialFamilyEvidence E) : ExponentialFamilyClosed E := by
  exact And.intro Ev.dominatedFamilyClosed (And.intro Ev.exponentialFormValidClosed (And.intro Ev.parameterSpaceConvexClosed Ev.logPartitionFiniteClosed))

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
