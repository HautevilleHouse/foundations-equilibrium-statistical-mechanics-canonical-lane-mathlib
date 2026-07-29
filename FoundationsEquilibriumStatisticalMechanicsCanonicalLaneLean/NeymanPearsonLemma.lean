import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure NeymanPearsonTest where
  hypothesis : Prop
  alternative : Prop
  testStatistic : Type u
  criticalRegion : Type v
  size : Prop
  power : Prop
  optimalityProof : Prop
  sizeTerm : size
  powerTerm : power
  optimalityProofTerm : optimalityProof

structure NeymanPearsonEvidence (N : NeymanPearsonTest) where
  sizeClosed : N.size
  powerClosed : N.power
  optimalityProofClosed : N.optimalityProof

def NeymanPearsonClosed (N : NeymanPearsonTest) : Prop :=
  N.size ∧ N.power ∧ N.optimalityProof

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonTest) (E : NeymanPearsonEvidence N) : NeymanPearsonClosed N := by
  exact And.intro E.sizeClosed (And.intro E.powerClosed E.optimalityProofClosed)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse