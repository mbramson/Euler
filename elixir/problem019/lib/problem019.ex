defmodule Problem019 do


  @doc """
  Returns the numerical difference between the first day and the second day of
  the same month and year. In the case that first_day = second_day this
  returns 0.

  Example: day_diff(%{year: 2000, month: 1, day: 1},
                    %{year: 2000, month: 1, day: 10})
           will return 9.
  """
  def day_diff(%{year: same_year, month: same_month, day: first_day},
               %{year: same_year, month: same_month, day: second_day}) do
    second_day - first_day
  end

  @doc """
  Returns the numerical difference in days between the first date and the
  second date when the first and second date are in the same year.
  """
  def day_diff(%{year: same_year, month: first_month, day: first_day},
               %{year: same_year, month: second_month, day: second_day}) do
    days_left_in_first_month =
      days_in(%{year: same_year, month: first_month}) - first_day

    days_in_months_between_first_and_second =
      days_in_months_between(first_month, second_month, same_year)

    days_in_last_month = second_day

    days_left_in_first_month +
    days_in_months_between_first_and_second +
    days_in_last_month

  end

  @doc """
  Returns the numerical difference in days between the first date and the
  second date when the first and second date are in different years.
  """
  def day_diff(%{year: first_year,  month: first_month,  day: first_day},
               %{year: second_year, month: second_month, day: second_day}) do
    nil # TODO: Implement
  end

  @doc """
  Returns the number of days in the months between the first_month and the
  second_month parameters in the given year. Takes into account leap years
  when the year is a leap year and one of the months being summed is February.

  Example: days_in_months_between(5, 8, 1998) will return:
    number of days in June (30) +
    number of days in July (31)
    = 61.
  """
  def days_in_months_between(first_month, second_month, year)
        when second_month > first_month + 1 do
    Enum.reduce(first_month+1..second_month-1, 0,
                fn month, acc -> acc + days_in(%{year: year, month: month}) end)
  end

  def days_in_months_between(first_month, second_month, year), do: 0

  @doc """
  Returns the number days in the given month on the given year.
  """
  def days_in(%{year: year, month: month}) do
    cond do
      month in [1,3,5,7,8,10,12] -> 31
      month in [4,6,9,11] -> 30
      month == 2 -> days_in_february(year)
      true -> nil
    end
  end

  @doc """
  Returns the number of days in a given year
  """
  def days_in(%{year: year}) do
    case leap_year?(year) do
      false -> 365
      _     -> 366
    end
  end

  defp days_in_february(year) do
    case leap_year?(year) do
      false -> 28
      _     -> 29
    end
  end

  @doc """
  Returns true if the given year is a leap year
  """
  def leap_year?(year) do
    (rem(year, 4) == 0 and rem(year, 100) != 0)
      or rem(year, 400) == 0
  end

end
