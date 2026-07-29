import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure SufficiencyCondition where
  sampleSpace : Type u
  parameterSpace : Type v
  statistic : sampleSpace → Type w
  conditionalDistribution : Type x
  factorizationCriterion : Prop
  minimalSufficiency : Prop
  completeness : Prop
  factorizationCriterionTerm : factorizationCriterion
  minimalSufficiencyTerm : minimalSufficiency
  completenessTerm : completeness

structure SufficiencyEvidence (S : SufficiencyCondition) where
  factorizationCriterionClosed : S.factorizationCriterion
  minimalSufficiencyClosed : S.minimalSufficiency
  completenessClosed : S.completeness

def SufficiencyClosed (S : SufficiencyCondition) : Prop :=
  S.factorizationCriterion ∧ S.minimalSufficiency ∧ S.completeness

theorem sufficiency_closed_from_evidence (S : SufficiencyCondition) (E : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro E.factorizationCriterionClosed (And.intro E.minimalSufficiencyClosed E.completenessClosed)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse