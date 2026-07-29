import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure SufficiencyExponentialFamilyPackage where
  sufficientStatistic : Type u
  exponentialFamilyDensity : Type v
  factorizationTheorem : Prop
  regularityConditions : Prop
  minimalSufficientExists : Prop

structure SufficiencyExponentialFamilyEvidence (S : SufficiencyExponentialFamilyPackage) where
  factorizationTheoremClosed : S.factorizationTheorem
  regularityConditionsClosed : S.regularityConditions
  minimalSufficientExistsClosed : S.minimalSufficientExists

def SufficiencyExponentialFamilyClosed (S : SufficiencyExponentialFamilyPackage) : Prop :=
  S.factorizationTheorem ∧ S.regularityConditions ∧ S.minimalSufficientExists

theorem sufficiency_exponential_family_closed_from_evidence
    (S : SufficiencyExponentialFamilyPackage) (E : SufficiencyExponentialFamilyEvidence S) :
    SufficiencyExponentialFamilyClosed S := by
  exact And.intro E.factorizationTheoremClosed
    (And.intro E.regularityConditionsClosed E.minimalSufficientExistsClosed)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse