defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    _count(strand, nucleotide, 0)
  end

  defp _count([], _, count), do: count
  defp _count([nucleotide | tail], nucleotide, count), do: _count(tail, nucleotide, count+1)
  defp _count([_ | tail], nucleotide, count), do: _count(tail, nucleotide, count)


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    _counts(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  end

  defp _counts([], counts), do: counts
  defp _counts([head | tail], counts), do: _counts(tail, Dict.put(counts, head, counts[head] + 1))
end
