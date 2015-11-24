defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    swap_keys_and_values(input)
      |> List.flatten
      |> Enum.into(%{})
  end

  defp swap_keys_and_values(input) do
    Enum.map(input, fn({score, words}) ->
      Enum.map(words, fn(word) ->
        {String.downcase(word), score}
      end)
    end)
  end
end
