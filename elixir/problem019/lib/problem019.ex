defmodule Problem019 do

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
