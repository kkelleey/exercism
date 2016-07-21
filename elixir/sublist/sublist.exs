defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(a,b) -> :sublist
      sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  def sublist?(a, b) do
    if Enum.count(a) > Enum.count(b) do
      false
    else
      Enum.any?(0..Enum.count(b) - Enum.count(a), fn(i) ->
        Enum.slice(b, i, Enum.count(a)) === a
      end)
    end
  end
end
