defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    _hamming_distance(strand1, strand2, 0)
  end

  defp _hamming_distance([], [], score), do: score
  defp _hamming_distance([head | tail], [head | other_tail], score), do: _hamming_distance(tail, other_tail, score)
  defp _hamming_distance([_ | tail], [_ | other_tail], score), do: _hamming_distance(tail, other_tail, score+1)
  defp _hamming_distance(_, _, _), do: nil
end
