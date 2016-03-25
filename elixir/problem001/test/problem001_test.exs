defmodule Problem001Test do
  use ExUnit.Case, async: true
  doctest MultipleSummer

  # sum_of_multiples test

  test "that sum_of_multiples returns 12 for multiples of 3 under 10" do
    assert MultipleSummer.sum_of_multiples(3, 10) == 18
  end

  test "that sum_of_multiples returns 0 for multiples of 2 under 1" do
    assert MultipleSummer.sum_of_multiples(2, 1) == 0
  end

  test "that sum_of_multiples returns 0 for multiples of 5 under 5" do
    assert MultipleSummer.sum_of_multiples(5, 5) == 0
  end

  # get_iterations tests

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

  # remove_duplicates tests

  test "that remove_duplicates removes duplicates" do
    assert MultipleSummer.remove_duplicates_in([1, 2, 2]) == [1, 2]
  end

  test "that remove_duplicates removes duplicates when not sequential" do
    assert MultipleSummer.remove_duplicates_in([1, 2, 3, 2]) == [1, 2, 3]
  end

  # remove_inter_multiples tests

  test "that remove_inter_multiples returns same single number" do
    assert MultipleSummer.remove_inter_multiples([2]) == [2]
  end

  test "that remove_inter_multiples returns [2] for [2,4]" do
    assert MultipleSummer.remove_inter_multiples([2,4]) == [2]
  end

  test "that remove_inter_multiples returns [2,3] for [2,3]" do
    assert MultipleSummer.remove_inter_multiples([2,3]) == [2,3]
  end

  test "that remove_inter_multiples returns [2, 5] for [4,10,2,5,15]" do
    assert MultipleSummer.remove_inter_multiples([4,10,2,5,15]) == [2,5]
  end

  # has_divisor_in? tests

  test "that has_divisor_in? is true when  divisor exists" do
    assert MultipleSummer.has_divisor_in?(6, [3])
  end

  test "that has_divisor_in? is true when divisor exists in long list" do
    assert MultipleSummer.has_divisor_in?(10, [3, 7, 9, 6, 15, 5])
  end

  test "that has_divisor_in? is false when no divisor exists in list" do
    assert MultipleSummer.has_divisor_in?(15, [4, 9]) == false
  end

  test "that has_divisor_in? is false when only divisor is the same number" do
    assert MultipleSummer.has_divisor_in?(5, [3, 5]) == false
  end

end
