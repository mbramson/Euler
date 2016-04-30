import Date

defmodule Problem019Test do
  use ExUnit.Case, async: true
  doctest Date

  # new tests

  test "new returns a %Date{} struct" do
    %Date{} = new(2002, 3, 5)
  end

  test "new validates passed in %Date{} struct" do
    assert_raise(
      RuntimeError,
      fn -> new(%Date{day: 0}) end )
  end

  test "new validates date" do
    assert_raise(
      RuntimeError,
      fn -> new(2000, 1, 50) end )
  end

  # validate tests
  test "default date is valid" do
    validate(%Date{})
  end

  test "correct date is valid" do
    validate(%{year: 2013, month: 5, day: 15})
  end

  test "feb 29 2000 is a valid date" do
    validate(%{year: 2000, month: 2, day: 29})
  end

  test "feb 29 2001 is not a valid date" do
    assert_raise(
      RuntimeError, "Date :: invalid day :: too large",
      fn -> validate(%{year: 2001, month: 2, day: 29}) end )
  end

  test "apr 31 2001 is not a valid date" do
    assert_raise(
      RuntimeError, "Date :: invalid day :: too large",
      fn -> validate(%{year: 2001, month: 4, day: 31}) end )
  end

  test "0 month is invalid" do
    assert_raise(
      RuntimeError, "Date :: invalid month :: too small",
      fn -> validate(%{year: 2000, month: 0, day: 1}) end )
  end

  test "13 month is invalid" do
    assert_raise(
      RuntimeError, "Date :: invalid month :: too large",
      fn -> validate(%{year: 2000, month: 13, day: 1}) end )
  end

  test "0 day is invalid" do
    assert_raise(
      RuntimeError, "Date :: invalid day :: too small",
      fn -> validate(%{year: 2000, month: 10, day: 0}) end )
  end

  # months_in_year_that_start_with tests
  test "4 months started with Monday between 1900 and 1901" do
    assert months_in_years_that_start_with(:monday, 1900, 1901) == 4
  end

  test "9 months started with Tuesday between 1900 and 1904" do
    assert months_in_years_that_start_with(:tuesday, 1900, 1904) == 9
  end

  test "2 months started with Monday in 1900" do
    assert months_in_years_that_start_with(:monday, 1900) == 2
  end

  test "3 months started with Thursday in 1900" do
    assert months_in_years_that_start_with(:thursday, 1900) == 3
  end

  test "1 month starts with Saturday in 2000" do
    assert months_in_years_that_start_with(:sunday, 2000) == 1
  end

  # day_of_week tests

  test "day_of_week is Monday Jan 1 1900" do
    assert day_of_week(%{year: 1900, month: 1, day: 1}) == :monday
  end

  test "day_of_week is Tuesday on Jan 2 1900" do
    assert day_of_week(%{year: 1900, month: 1, day: 2}) == :tuesday
  end

  test "day_of_week is Wednesday on Jan 10 1900" do
    assert day_of_week(%{year: 1900, month: 1, day: 10}) == :wednesday
  end

  test "day_of_week is Thursday on Feb 15 1900" do
    assert day_of_week(%{year: 1900, month: 2, day: 15}) == :thursday
  end

  test "day_of_week is Friday on July 19 1901" do
    assert day_of_week(%{year: 1901, month: 7, day: 19}) == :friday
  end

  test "day_of_week is Satuday on March 5 1904" do
    assert day_of_week(%{year: 1904, month: 3, day: 5}) == :saturday
  end

  test "day_of_week is Sunday on April 24 2016" do
    assert day_of_week(%{year: 2016, month: 4, day: 24}) == :sunday
  end

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

  test "day_diff is 366 across three years between dec 31 and jan 1 for non-leap year" do
    assert day_diff(%{year: 2001, month: 12, day: 31},
                    %{year: 2003, month: 1, day: 1})
      == 366
  end

  test "day_diff is 367 across three years between dec 31 and jan 1 for leap year" do
    assert day_diff(%{year: 1999, month: 12, day: 31},
                    %{year: 2001, month: 1, day: 1})
      == 367
  end

  test "day_diff is  across four years between nov 1 and mar 1 with no leap year" do
    assert day_diff(%{year: 2000, month: 11, day: 1},
                    %{year: 2003, month: 3, day: 1})
      == 850
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

  # days_in_years_between tests

  test "days_in_years_between is 0 for adjacent years" do
    assert days_in_years_between(2000,2001) == 0
  end

  test "days_in_years_between is 365 when one non-leap-year between years" do
    assert days_in_years_between(2000,2002) == 365
  end

  test "days_in_years_between is 366 when one leap-year is between years" do
    assert days_in_years_between(1999,2001) == 366
  end

  test "days_in_years_between is 731 for two years one of which is leap" do
    assert days_in_years_between(1999,2002) == 731
  end

  # days_left_in_year tests

  test "days_left_in_year is 0 on Dec 31" do
    assert days_left_in_year(%{year: 2000, month: 12, day: 31}) == 0
  end

  test "days_left_in_year is 10 on Dec 21" do
    assert days_left_in_year(%{year: 2000, month: 12, day: 21}) == 10
  end

  test "days_left_in_year is 71 on Oct 21" do
    assert days_left_in_year(%{year: 2000, month: 10, day: 21}) == 71
  end

  test "days_left_in_year is 364 on Jan 1 of non-leap year" do
    assert days_left_in_year(%{year: 2001, month: 1, day: 1}) == 364
  end

  test "days_left_in_year is 365 on Jan 1 of leap year" do
    assert days_left_in_year(%{year: 2000, month: 1, day: 1}) == 365
  end

  # days_until_date tests
  test "days_until_date is 1 on Jan 1" do
    assert days_until_date(%{year: 2000, month: 1, day: 1}) == 1
  end

  test "days_until_date is 10 on Jan 10" do
    assert days_until_date(%{year: 2000, month: 1, day: 10}) == 10
  end

  test "days_until_date is 32 on Feb 1" do
    assert days_until_date(%{year: 2000, month: 2, day: 1}) == 32
  end

  test "days_until_date is 365 on Dec 31 of non-leap year" do
    assert days_until_date(%{year: 2001, month: 12, day: 31}) == 365
  end

  test "days_until_date is 366 on Dec 31 of leap year" do
    assert days_until_date(%{year: 2000, month: 12, day: 31}) == 366
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

  test "leap_year? is false in 2000" do
    assert leap_year? 2000
  end

  test "leap_year? is false in 1900" do
    refute leap_year? 1800
  end

end
