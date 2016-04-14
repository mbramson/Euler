import Problem019

defmodule Problem019Test do
  use ExUnit.Case, async: true
  doctest Problem019

  # days_in tests

  test "days_in is 31 in January" do
    assert days_in(%{year: 2000, month: 1}) == 31
  end

  test "days_in is 28 in February for non-leap-years" do
    assert days_in(%{year: 1999, month: 2}) == 28
  end

  test "days_in is 29 in February on a leap year" do
    assert days_in(%{year: 2004, month: 2}) == 29
  end

  test "days_in is 31 in March" do
    assert days_in(%{year: 2000, month: 3}) == 31
  end

  test "days_in is 30 in April" do
    assert days_in(%{year: 2000, month: 4}) == 30
  end

  test "days_in is 31 in May" do
    assert days_in(%{year: 2000, month: 5}) == 31
  end

  test "days_in is 30 in June" do
    assert days_in(%{year: 2000, month: 6}) == 30
  end

  test "days_in is 30 in July" do
    assert days_in(%{year: 2000, month: 7}) == 31
  end

  test "days_in is 31 in August" do
    assert days_in(%{year: 2000, month: 8}) == 31
  end

  test "days_in is 30 in September" do
    assert days_in(%{year: 2000, month: 9}) == 30
  end

  test "days_in is 31 in October" do
    assert days_in(%{year: 2000, month: 10}) == 31
  end

  test "days_in is 30 in November" do
    assert days_in(%{year: 2000, month: 11}) == 30
  end

  test "days_in is 31 in December" do
    assert days_in(%{year: 2000, month: 12}) == 31
  end

  test "days_in is 365 on a non-leap-year" do
    assert days_in(%{year: 2435}) == 365
  end

  test "days_in is 366 on a leap year" do
    assert days_in(%{year: 2016}) == 366
  end

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
