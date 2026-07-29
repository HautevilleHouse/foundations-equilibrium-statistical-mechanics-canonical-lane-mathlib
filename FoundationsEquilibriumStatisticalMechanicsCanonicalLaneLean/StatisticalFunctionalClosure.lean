import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure StatisticalFunctionalPackage where
  functionalParameter : Type u
  plugInEstimator : Type v
  hadamardDifferentiability : Prop
  functionalDeltaMethodResult : Prop

structure StatisticalFunctionalEvidence (S : StatisticalFunctionalPackage) where
  hadamardDifferentiabilityClosed : S.hadamardDifferentiability
  functionalDeltaMethodResultClosed : S.functionalDeltaMethodResult

def StatisticalFunctionalClosed (S : StatisticalFunctionalPackage) : Prop :=
  S.hadamardDifferentiability ∧ S.functionalDeltaMethodResult

theorem statistical_functional_closed_from_evidence
    (S : StatisticalFunctionalPackage) (E : StatisticalFunctionalEvidence S) :
    StatisticalFunctionalClosed S := by
  exact And.intro E.hadamardDifferentiabilityClosed E.functionalDeltaMethodResultClosed

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse