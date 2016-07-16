defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/^\s*$/) -> "Fine. Be that way!"
      String.upcase(input) == input &&
        String.match?(input, ~r/\p{Lu}/) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
