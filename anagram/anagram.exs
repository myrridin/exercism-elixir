defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    _match(base, candidates, [])
  end

  defp _match(_, [], matches), do: matches
  defp _match(base, [head | tail], matches) do
    if anagram?(String.downcase(base), String.downcase(head)) do
      _match(base, tail, matches ++ [head])
    else
      _match(base, tail, matches)
    end
  end

  defp anagram?(base, match) do
    base_sorted = String.split(base, "") |> Enum.sort
    match_sorted = String.split(match, "") |> Enum.sort
    base_sorted == match_sorted && base != match
  end
end
