import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean

structure EquilibriumMeasure where
  stateSpace : Type u
  energyFunction : stateSpace → ℝ
  temperature : ℝ
  partitionFunction : ℝ
  gibbsMeasure : Type v
  existence : Prop
  uniqueness : Prop
  thermodynamicLimit : Prop
  existenceTerm : existence
  uniquenessTerm : uniqueness
  thermodynamicLimitTerm : thermodynamicLimit

structure EquilibriumMeasureEvidence (E : EquilibriumMeasure) where
  existenceClosed : E.existence
  uniquenessClosed : E.uniqueness
  thermodynamicLimitClosed : E.thermodynamicLimit

def EquilibriumMeasureClosed (E : EquilibriumMeasure) : Prop :=
  E.existence ∧ E.uniqueness ∧ E.thermodynamicLimit

theorem equilibrium_measure_closed_from_evidence (E : EquilibriumMeasure) (Ev : EquilibriumMeasureEvidence E) : EquilibriumMeasureClosed E := by
  exact And.intro Ev.existenceClosed (And.intro Ev.uniquenessClosed Ev.thermodynamicLimitClosed)

end FoundationsEquilibriumStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse