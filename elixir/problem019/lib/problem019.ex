defmodule Problem019 do


  def day_diff(%{year: same_year, month: same_month, day: first_day},
               %{year: same_year, month: same_month, day: second_day}) do
    second_day - first_day
  end

  def day_diff(%{year: same_year, month: first_month, day: first_day},
               %{year: same_year, month: second_month, day: second_day}) do
    days_left_in_first_month =
      days_in(%{year: same_year, month: first_month}) - first_day

    days_in_months_between_first_and_second = 0 # TODO: Implement

    days_in_last_month = second_day

    days_left_in_first_month +
    days_in_months_between_first_and_second +
    days_in_last_month

  end

  def day_diff(%{year: first_year,  month: first_month,  day: first_day},
               %{year: second_year, month: second_month, day: second_day}) do
    nil # TODO: Implement
  end

  def days_in(%{year: year, month: month}) do
    cond do
      month in [1,3,5,7,8,10,12] -> 31
      month in [4,6,9,11] -> 30
      month == 2 -> days_in_february(year)
      true -> nil
    end
  end

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

  def leap_year?(year) do
    (rem(year, 4) == 0 and rem(year, 100) != 0)
      or rem(year, 400) == 0
  end

end
