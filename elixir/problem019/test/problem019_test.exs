import Problem019

defmodule Problem019Test do
  use ExUnit.Case, async: true
  doctest Problem019

  # leap_year? tests

  test "leap_year? is true in 2012" do
    assert leap_year? 2012
  end

  test "leap_year? is false in 1995" do
    refute leap_year? 1995
  end

  test "leap_year? is true in 2000" do
    assert leap_year? 2000
  end

  test "leap_year? is false in 1900" do
    refute leap_year? 1800
  end

end
