import Mathlib.LinearAlgebra.RootSystem.Defs

open Set Function
open Module hiding reflection
----------- Proof of Rank 1 Classification ------------------------------------------------
variable {ι R M N : Type*}
  [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
  [OfNat ι 0] [DecidableEq ι]

-- Define what it means for a root system to be rank 1
def is_rank_one_root_system (P : RootSystem ι R M N) : Prop :=
  ∃ (α : M), α ≠ 0 ∧ ∀ i : ι, P.root i = if i = 0 then α else -α

-- A theorem stating that any rank 1 root system is isomorphic to A1
theorem rank_one_classification (P : RootSystem ι R M N) (h : is_rank_one_root_system P) :
  ∃ (α : M), (P.root : ι → M) = (λ i => if i = 0 then α else -α) :=
  by
    obtain ⟨α, hα⟩ := h
    use α
    ext i
    exact hα.2 i
