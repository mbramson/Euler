
 # If we list all the natural numbers below 10 that are multiples of 3 or 5,
 # we get 3,5,6 and 9, The sum of these multiples is 23.
 #
 # Find the sum of all the multiples of 3 or 5 below 1000.

defmodule MultipleSummer do

  def sum_of_multiples(n, limit) do
    iterations = get_iterations(n, limit)
    n * iterations * (iterations + 1) / 2
  end

  def get_iterations(n, limit) do
    div(limit-1, n)
  end

  def remove_duplicates_in(list) do
    Enum.uniq(list)
  end

  def remove_inter_multiples(list) do
    [x|y] = list
    [x]
  end

  def has_divisor_in?(n, list) do
    # filter list for only perfect divisors that aren't equal to n
    divisors = for d <- list, rem(n, d) == 0 and n != d, do: d
    divisors  != []
  end
end
