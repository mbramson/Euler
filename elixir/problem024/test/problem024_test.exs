defmodule LexicographicPermutationTest do
  use ExUnit.Case
  doctest LexicographicPermutation

  import LexicographicPermutation
  
  test "permutations of empty list is empty list" do
    assert ordered_permute([]) == []
  end

  test "permutation of single element list is that element as string" do
    assert ordered_permute([1]) == ["1"]
  end

  test "permutation of single element list is that element" do
    assert ordered_permute(["c"]) == ["c"]
  end

  @tag :skip
  test "two element permutation" do
    assert ordered_permute([0, 1]) == ["01", "10"]
  end

  # generate_order_map tests

  test "order map of no element list is empty map" do
    assert generate_order_map([]) == %{}
  end

  test "order map of one element list is correct" do
    assert generate_order_map(["C"]) == %{"C" => 1}
  end

  test "order map of two element list is correct" do
    assert generate_order_map(["G", "F"]) == %{"G" => 1, "F" => 2}
  end

  test "order map of three element list is correct" do
    assert generate_order_map(["C", "A", "B"]) == %{"C" => 1, "A" => 2, "B" => 3}
  end
end
