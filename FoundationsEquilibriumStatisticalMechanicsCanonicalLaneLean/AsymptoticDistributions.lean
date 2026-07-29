import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure AsymptoticDistributionsPackage where
  estimatorSequence : Type u
  asymptoticNormality : Prop
  efficiencyBound : Prop
  deltaMethod : Prop
  functionalDeltaMethod : Prop

structure AsymptoticDistributionsEvidence (A : AsymptoticDistributionsPackage) where
  asymptoticNormalityClosed : A.asymptoticNormality
  efficiencyBoundClosed : A.efficiencyBound
  deltaMethodClosed : A.deltaMethod
  functionalDeltaMethodClosed : A.functionalDeltaMethod

def AsymptoticDistributionsClosed (A : AsymptoticDistributionsPackage) : Prop :=
  A.asymptoticNormality ∧ A.efficiencyBound ∧ A.deltaMethod ∧ A.functionalDeltaMethod

theorem asymptotic_distributions_closed_from_evidence
    (A : AsymptoticDistributionsPackage) (E : AsymptoticDistributionsEvidence A) :
    AsymptoticDistributionsClosed A := by
  exact And.intro E.asymptoticNormalityClosed
    (And.intro E.efficiencyBoundClosed
      (And.intro E.deltaMethodClosed E.functionalDeltaMethodClosed))

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse