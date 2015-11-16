defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      contains_list?(a, b) -> :superlist
      contains_list?(b, a) -> :sublist
      true -> :unequal
    end
  end

  # true if the first list contains the second list contiguously
  defp contains_list?(_, []), do: true
  defp contains_list?([], __), do: false

  defp contains_list?([head | parent_tail], child = [head | child_tail]) do
    if contains_full_list?(parent_tail, child_tail) do
      true
    else
      contains_list?(parent_tail, child)
    end
  end
  defp contains_list?([head | tail], child), do: contains_list?(tail, child) 

  # true if the second list matches the first list from the first element through it's entirety
  defp contains_full_list?(_, []), do: true
  defp contains_full_list?([], _), do: false
  defp contains_full_list?([head | parent_tail], [head | child_tail]), do: contains_full_list?(parent_tail, child_tail)
  defp contains_full_list?(_, _), do: false
end
