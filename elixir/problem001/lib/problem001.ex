
 # If we list all the natural numbers below 10 that are multiples of 3 or 5,
 # we get 3,5,6 and 9, The sum of these multiples is 23.
 #
 # Find the sum of all the multiples of 3 or 5 below 1000.

defmodule MultipleSummer do

  def sum_multiples(multiples, limit) do
    # remove duplicates in the multiples list
    multiples = remove_duplicates_in(multiples)
    # remove any numbers that are multiples of a smaller number since any
    # multiple of the larger number is also a multiple of the smaller number
    multiples = remove_inter_multiples(multiples)
    # produce a list of total for each multiple
    totals = for n <- multiples, do: sum_of_single_multiple(n, limit)
    # produce a list of multiples that will be subtracted out
    subtractors = get_subtractors(multiples)
    subtractors_totals = for n <- subtractors, do: sum_of_single_multiple(n, limit)
    # add the totals, and subtract the double counted subtractor totals
    Enum.sum(totals) - Enum.sum(subtractors_totals)
  end

  def sum_of_single_multiple(n, limit) do
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
    # filter out any numbers in the list that have a divisor in the list that
    # isn't itself.
    for n <- list, !has_divisor_in?(n, list), do: n
  end

  def has_divisor_in?(n, list) do
    # filter list for only perfect divisors that aren't equal to n
    divisors = for d <- list, rem(n, d) == 0 and n != d, do: d
    divisors != []
  end

  def get_subtractors(multiples) do
      # assumes that multiples has no duplicates.
      for a <- multiples,
          b <- multiples,
          # this could also be >, it just ensures the same two numbers aren't
          # multiplied twice, and that a number isn't multiplied by itself.
          a < b,
          do: a * b
  end

  def get_all_subtractors(multiples) when length(multiples) <= 1, do: []

  def get_all_subtractors(multiples) when is_list(multiples) do
    cond do
      length(multiples) == 2 -> product(multiples)
      true -> [product(multiples)] ++ for n <- multiples, do: get_all_subtractors(List.delete(multiples, n))
    end
    # assumption: multiples has no duplicates
  end

  def product(list) when is_list(list) do
      Enum.reduce(list, fn x,acc -> x * acc end)
  end
end
