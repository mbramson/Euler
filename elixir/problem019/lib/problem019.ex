defmodule Problem019 do

  def days_in(month, year) when is_atom(month) do
    case month do
      :january -> 31
      :february -> days_in_february(year)
      :march -> 31
      :april -> 30
      :may -> 31
      :june -> 30
      :july -> 31
      :august -> 31
      :september -> 30
      :october -> 31
      :november -> 30
      :december -> 31
    end
  end

  def days_in(year) do
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
