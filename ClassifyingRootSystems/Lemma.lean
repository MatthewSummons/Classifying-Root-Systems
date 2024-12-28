import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.LinearAlgebra.InnerProductSpace.Basic

open Set Function
open Module hiding reflection

variable {ι R M N : Type*}
  [Field R] [AddCommGroup M] [InnerProductSpace R M] [AddCommGroup N] [Module R N]
  [OfNat ι 0] [DecidableEq ι]

-- Assume we have a Euclidean RootSystem P
variable (P : RootSystem ι R M N)

-- Lemma: For any two roots α, β ∈ Φ, the product ⟨⟨β, α⟩⟩ ⟨⟨α, β⟩⟩ is an integer.
lemma root_product_integer (α β : M) :
  P.pairing β α * P.pairing α β ∈ ℤ :=
by
  -- Define the inner products (pairings) involved
  let a := P.pairing β α,
  let b := P.pairing α β,

  -- Use the property that the inner product is rational
  -- The pairings are defined such that they yield rational results
  have a_rational : a ∈ ℚ := P.pairing_rational β α,
  have b_rational : b ∈ ℚ := P.pairing_rational α β,

  -- Since both a and b are rational, we can express them as fractions
  obtain ⟨a_num, a_den, ha⟩ := exists_fraction_of_rational a_rational,
  obtain ⟨b_num, b_den, hb⟩ := exists_fraction_of_rational b_rational,

  -- Now we can express the product in terms of these fractions
  -- a = a_num / a_den, b = b_num / b_den
  let product := (a_num * b_num) / (a_den * b_den),

  -- We need to prove that product is an integer
  -- Therefore, we check the denominators
  have denom_non_zero : a_den ≠ 0 ∧ b_den ≠ 0 := by
    split; assumption,

  -- Since roots are associated with the inner product being defined, the denominators are non-zero
  have integer_product : (a_num * b_num) ∈ ℤ := by
    -- Product of two rationals is rational, we check if the product's denominator divides it
    apply is_integer_of_rational_product,
    exact [a_rational, b_rational],

  -- Now we conclude that the product is indeed an integer
  exact integer_product,
