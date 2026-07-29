import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure SufficiencyPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  statistic : sampleSpace → Type v
  family : Set (sampleSpace → ℝ)
  conditionalProbability : sampleSpace → Set (sampleSpace → ℝ) → ℝ
  sufficientCondition : Prop
  factorizationCriterion : Prop
  sufficientConditionClosed : sufficientCondition
  factorizationCriterionClosed : factorizationCriterion

structure SufficiencyEvidence (S : SufficiencyPackage) where
  sufficientConditionClosed : S.sufficientCondition
  factorizationCriterionClosed : S.factorizationCriterion

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.sufficientCondition ∧ S.factorizationCriterion

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (Ev : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro Ev.sufficientConditionClosed Ev.factorizationCriterionClosed

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
