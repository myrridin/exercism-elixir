defmodule DNA do
  @mapping %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    _to_rna(dna, [])
  end

  defp _to_rna([], rna), do: rna
  defp _to_rna([head | tail], rna) do
    _to_rna(tail, rna ++ [@mapping[head]])
  end
end
