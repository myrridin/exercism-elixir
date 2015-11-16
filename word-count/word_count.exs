defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = remove_punctuation(sentence)
    |> String.split
    |> count_words(%{})
  end

  defp remove_punctuation(string) do
    Regex.replace(~r/[^\pL\d-]/u, string, " ")
  end

  defp count_words([], words), do: words
  defp count_words([head | tail], words) do
    count_words(tail, Dict.update(words, String.downcase(head), 1, fn(val) -> val + 1 end))
  end
end
