import Problem019

defmodule Problem019Test do
  use ExUnit.Case, async: true
  doctest Problem019

  # days_in tests

  test "days_in is 31 in January" do
    assert days_in(:january, 2000) == 31
  end

  test "days_in is 28 in February for non-leap-years" do
    assert days_in(:february, 1999) == 28
  end

  test "days_in is 29 in February on a leap year" do
    assert days_in(:february, 2004) == 29
  end

  test "days_in is 31 in March" do
    assert days_in(:march, 2000) == 31
  end

  test "days_in is 30 in April" do
    assert days_in(:april, 2000) == 30
  end

  test "days_in is 31 in May" do
    assert days_in(:may, 2000) == 31
  end

  test "days_in is 30 in June" do
    assert days_in(:june, 2000) == 30
  end

  test "days_in is 30 in July" do
    assert days_in(:july, 2000) == 31
  end

  test "days_in is 31 in August" do
    assert days_in(:august, 2000) == 31
  end

  test "days_in is 30 in September" do
    assert days_in(:september, 2000) == 30
  end

  test "days_in is 31 in October" do
    assert days_in(:october, 2000) == 31
  end

  test "days_in is 30 in November" do
    assert days_in(:november, 2000) == 30
  end

  test "days_in is 31 in December" do
    assert days_in(:december, 2000) == 31
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
