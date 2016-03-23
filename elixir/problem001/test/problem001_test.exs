defmodule Problem001Test do
  use ExUnit.Case, async: true
  doctest MultipleSummer

  test "that get_iterations returns an integer" do
    n = MultipleSummer.get_iterations(4, 10)
    assert is_integer(n)
  end

  test "that get_iterations is 2 for limit of 10 and n of 4" do
    n = MultipleSummer.get_iterations(4 ,10)
    assert n == 2, "there should be 2 iterations"
  end

  test "that get_iterations is 3 for limit of 12 and n of 3" do
    n = MultipleSummer.get_iterations(3 ,12)
    assert n == 3, "there should be 3 iterations" 
  end
end
