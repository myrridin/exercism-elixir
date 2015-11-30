defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c), do: _kind(Enum.sort([a, b, c]))

  defp _kind([x, _, _]) when x <= 0, do: {:error, "all side lengths must be positive"}
  defp _kind([x, y, z]) when z >= (x+y), do: {:error, "side lengths violate triangle inequality"}
  defp _kind([x, x, x]), do: {:ok, :equilateral}
  defp _kind([x, x, _]), do: {:ok, :isosceles}
  defp _kind([_, x, x]), do: {:ok, :isosceles}
  defp _kind(_),         do: {:ok, :scalene}
end
