import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure AdmissibleStatObject where
  model : Type u
  sampleSpace : Type v
  likelihoodFunction : Prop
  priorDistribution : Prop
  posteriorDistribution : Prop
  conclusion : likelihoodFunction → priorDistribution → posteriorDistribution

structure AdmissibleClass where
  object : AdmissibleStatObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse