defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> repeating_groups
    |> Enum.map_join(&count_and_letter/1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string, capture: :all_but_first)
     |> Enum.map_join(&multiply_letters/1)
  end

  defp repeating_groups(string) do
    Regex.scan(~r/(.)\1*/, string)
  end

  defp count_and_letter([match, char]) do
    "#{String.length(match)}#{char}"
  end

  defp multiply_letters([count, letter]) do
    count = String.to_integer(count)
    String.duplicate(letter, count)
  end
end
