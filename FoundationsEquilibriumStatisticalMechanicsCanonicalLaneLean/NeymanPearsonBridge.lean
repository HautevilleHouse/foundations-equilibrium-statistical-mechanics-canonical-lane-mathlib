import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure NeymanPearsonPackage where
  nullHypothesis : Set (sampleSpace → ℝ)
  alternativeHypothesis : Set (sampleSpace → ℝ)
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  likelihoodRatio : (sampleSpace → ℝ) → ℝ
  criticalRegion : Set sampleSpace
  significanceLevel : ℝ
  power : ℝ
  lemmaStatement : Prop
  mostPowerful : Prop
  lemmaStatementClosed : lemmaStatement
  mostPowerfulClosed : mostPowerful

structure NeymanPearsonEvidence (N : NeymanPearsonPackage) where
  lemmaStatementClosed : N.lemmaStatement
  mostPowerfulClosed : N.mostPowerful

def NeymanPearsonClosed (N : NeymanPearsonPackage) : Prop :=
  N.lemmaStatement ∧ N.mostPowerful

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonPackage) (Ev : NeymanPearsonEvidence N) : NeymanPearsonClosed N := by
  exact And.intro Ev.lemmaStatementClosed Ev.mostPowerfulClosed

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
