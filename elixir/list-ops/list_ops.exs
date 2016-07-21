defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0

  def count([_head | tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse(list) do
    _reverse(list, [])
  end

  defp _reverse([], reversed), do: reversed
  defp _reverse([head | tail], reversed) do
    _reverse(tail, [head | reversed])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], f) do
    if f.(head) do
      [ head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append([head | tail], rest) do
    [head | append(tail, rest)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]) do
    append(head, concat(tail))
  end
end
