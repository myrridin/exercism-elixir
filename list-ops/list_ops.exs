defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end

  defp _count([], total), do: total
  defp _count([_ | tail], total), do: _count(tail, total + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], new_list), do: new_list
  defp _reverse([head | tail], new_list), do: _reverse(tail, [head | new_list])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f, [])
  end

  defp _map([], _, new_list), do: reverse(new_list)
  defp _map([head | tail], f, new_list), do: _map(tail, f, [f.(head) | new_list])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f, [])
  end

  defp _filter([], _, new_list), do: reverse(new_list)
  defp _filter([head | tail], f, new_list) do
    if(f.(head)) do
      _filter(tail, f, [head | new_list])
    else
      _filter(tail, f, new_list)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, _), do: acc
  defp _reduce([head | tail], acc, f), do: _reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    _append(b, reverse(a))
  end

  defp _append([], list), do: reverse(list)
  defp _append([head | tail], list), do: _append(tail, [head | list])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(_concat(ll, []))
  end

  def _concat([], list), do: list
  def _concat([head | tail], list) when is_list(head), do: _concat(tail, _concat(head, list))
  def _concat([head | tail], list), do: _concat(tail, [head | list])
end
