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

  # generate_next_permutation tests

  test "next permutation of empty list is an empty list" do
    assert next_permutation([]) == []
  end

  @tag :skip
  test "next permutation of two element list is correct" do
    assert next_permutation([0, 1]) == [1, 0]
  end

  # generate_order_map tests

  test "order map of no element list is empty map" do
    assert generate_order_map([]) == %{}
  end

  test "order map of one element list is correct" do
    assert generate_order_map(["C"]) == %{1 => "C"}
  end

  test "order map of two element list is correct" do
    assert generate_order_map(["G", "F"]) == %{1 => "G", 2 => "F"}
  end

  test "order map of three element list is correct" do
    assert generate_order_map(["C", "A", "B"]) == %{1 => "C", 2 => "A", 3 => "B"}
  end
end
