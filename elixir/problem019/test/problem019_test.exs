import Problem019

defmodule Problem019Test do
  use ExUnit.Case, async: true
  doctest Problem019

  # day_diff tests

  # same month and year

  test "day_diff is 0 between a day and itself" do
    assert day_diff(%{year: 1900, month: 1, day: 1},
                    %{year: 1900, month: 1, day: 1})
      == 0
  end

  test "day_diff is 1 between a day and the next one" do
    assert day_diff(%{year: 1900, month: 1, day: 1},
                    %{year: 1900, month: 1, day: 2})
      == 1
  end

  test "day_diff is -1 between a day and the previous one" do
    assert day_diff(%{year: 1900, month: 1, day: 9},
                    %{year: 1900, month: 1, day: 8})
      == -1
  end

  # same year

  test "day_diff is 1 across the end of a month" do
    assert day_diff(%{year: 1900, month: 3, day: 31},
                    %{year: 1900, month: 4, day: 1})
      == 1
  end

  test "day_diff is 1 between feb 28 and march 1 on non-leap-year" do
    assert day_diff(%{year: 1900, month: 2, day: 28},
                    %{year: 1900, month: 3, day: 1})
      == 1
  end

  test "day_diff is 2 between feb 28 and march 1 on leap-year" do
    assert day_diff(%{year: 2004, month: 2, day: 28},
                    %{year: 2004, month: 3, day: 1})
      == 2
  end

  test "day_diff is 1 between feb 29 and march 1 on leap-year" do
    assert day_diff(%{year: 2004, month: 2, day: 29},
                    %{year: 2004, month: 3, day: 1})
      == 1
  end

  test "day_diff is 31 between March 31 and May 1" do
    assert day_diff(%{year: 2000, month: 3, day: 31},
                    %{year: 2000, month: 5, day: 1})
      == 31
  end

  # different years

  test "day_diff is 1 across sequential years between dec 31 and jan 1" do
    assert day_diff(%{year: 1999, month: 12, day: 31},
                    %{year: 2000, month: 1, day: 1})
      == 1
  end

  test "day_diff is 32 across sequential years between dec 31 and feb 1" do
    assert day_diff(%{year: 1999, month: 12, day: 31},
                    %{year: 2000, month: 2, day: 1})
      == 32
  end

  test "day_diff is 42 across sequential years between nov 20 and jan 1" do
    assert day_diff(%{year: 1999, month: 11, day: 20},
                    %{year: 2000, month: 1, day: 1})
      == 42
  end

  test "day_diff is 61 across sequential years between dec 31 and mar 1 on leap year" do
    assert day_diff(%{year: 1999, month: 12, day: 31},
                    %{year: 2000, month: 3, day: 1})
      == 61
  end

  test "day_diff is 60 across sequential years between dec 31 and mar 1 on non-leap year" do
    assert day_diff(%{year: 2001, month: 12, day: 31},
                    %{year: 2002, month: 3, day: 1})
      == 60
  end

  # days_in_months_between tests

  test "days_in_months_between is total days in May for months 4 and 6" do
    assert days_in_months_between(4, 6, 2000) == 31
  end

  test "days_in_months_between sums across two months" do
    assert days_in_months_between(5, 8, 2000) == 61
  end

  test "days_in_months_between is 29 when summing february on leap years" do
    assert days_in_months_between(1, 3, 2000) == 29
  end

  test "days_in_months_between is 28 when summing february on non-leap-years" do
    assert days_in_months_between(1, 3, 1998) == 28
  end

  test "days_in_months_between is 0 when months are one apart" do
    assert days_in_months_between(1, 2, 1998) == 0
  end

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
