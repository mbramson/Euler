defmodule LexicographicPermutation do
  @moduledoc """
  Utility to assist in solving problems concerning ordered permutations of
  members of a list.
  """
  
  @doc """
  Returns all permutations of the items in the given list in lexicographic
  order where the resulting lexicographic order is determined by the order of
  the elements in the input list.
  """
  @spec ordered_permute([integer() | binary()]) :: [binary()]
  def ordered_permute([]), do: []
  def ordered_permute([a]) when is_integer(a), do: [Integer.to_string(a)]
  def ordered_permute([a]) when is_binary(a), do: [a]
  def ordered_permute(members) do
    []
  end
  
  @doc """
  Generates a map where the keys are the positions of the elements in the original
  array and the values are the associated element in the original list.

  ## Example
  
      iex> generate_order_map(["A", "B", "C"])
      %{1 => "A", 2 => "B", 3 => "C"}
  """
  @spec generate_order_map([any()]) :: %{binary() => integer()}
  def generate_order_map(list) when is_list(list) do 
    list
    |> _generate_order_map(1, [])
    |> Enum.into(%{})
  end
  defp _generate_order_map([], _, acc), do: acc
  defp _generate_order_map([head|tail], index, acc) do
    _generate_order_map(tail, index + 1, acc ++ [{index, head}])
  end

end
