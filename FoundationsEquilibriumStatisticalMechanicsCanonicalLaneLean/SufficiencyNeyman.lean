import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean.ExponentialFamily

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure SufficiencyNeymanPackage (A : AdmissibleClass) (E : ExponentialFamily A) where
  sufficientStatistic : E.sampleSpace → ℝⁿ
  factorizationTheorem : ∃ h : E.sampleSpace → ℝ, ∃ g : ℝⁿ × ℝⁿ → ℝ, density = λ x => h x * g (sufficientStatistic x, parameter)
  neymanCriterion : (∀ x y, sufficientStatistic x = sufficientStatistic y → likelihoodRatio x y independentOfParameter) ↔ isSufficient sufficientStatistic

structure SufficiencyNeymanEvidence (A : AdmissibleClass) (E : ExponentialFamily A) (S : SufficiencyNeymanPackage A E) where
  factorizationTheoremClosed : S.factorizationTheorem
  neymanCriterionClosed : S.neymanCriterion

def SufficiencyNeymanClosed (A : AdmissibleClass) (E : ExponentialFamily A) (S : SufficiencyNeymanPackage A E) : Prop :=
  S.factorizationTheorem ∧ S.neymanCriterion

theorem sufficiency_neyman_closed_from_evidence (A : AdmissibleClass) (E : ExponentialFamily A) (S : SufficiencyNeymanPackage A E) (Ev : SufficiencyNeymanEvidence A E S) : SufficiencyNeymanClosed A E S := by
  exact And.intro Ev.factorizationTheoremClosed Ev.neymanCriterionClosed

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse