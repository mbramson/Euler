defmodule LexicographicPermutationTest do
  use ExUnit.Case
  doctest LexicographicPermutation

  import LexicographicPermutation
  
  test "permutations of empty list is empty list" do
    assert ordered_permute([]) == []
  end

  test "permutation of single element list is that element" do
    assert ordered_permute([1]) == [1]
  end

end
