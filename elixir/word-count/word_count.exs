defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> words
    |> count_words
  end

  def count_words(words) do
    Enum.reduce(words, %{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end

  def words(string) do
    Regex.scan(~r/[\pL0-9\-]+/u, string)
    |> List.flatten
  end

end
