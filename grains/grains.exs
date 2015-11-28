defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(1), do: 1
  def square(num), do: 2 * square(num-1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    Enum.reduce((1..64), 0, fn(sq_num, acc) -> square(sq_num) + acc end)
  end
end
