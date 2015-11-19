defmodule Teenager do
  def hey(input) do
    cond do
      yelling?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      nothing?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp yelling?(input) do
    String.upcase(input) == input && Regex.match?(~r/[^\W\d_]/u, input)
  end

  defp question?(input) do
    String.at(input, -1) == "?"
  end

  defp nothing?(input) do
    String.strip(input) == ""
  end
end

