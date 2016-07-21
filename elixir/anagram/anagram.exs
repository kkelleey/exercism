defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_letters = sorted_letters(base)
    Enum.filter(candidates, fn(candidate) ->
      !same?(base, candidate) && sorted_letters(candidate) == base_letters
    end)
  end

  def sorted_letters(string) do
    string
    |> String.downcase
    |> String.to_charlist
    |> Enum.sort
  end

  def same?(base, candidate) do
    String.downcase(base) == String.downcase(candidate)
  end
end
