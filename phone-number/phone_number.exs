defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    if invalid_characters?(raw), do: bad_number, else: _number(String.graphemes(raw), [])
  end

  @numbers Enum.map(0..9, fn(x) -> Integer.to_string(x, 10) end)

  defp _number([], clean) do
    cond do
      length(clean) == 10                    -> join_numbers(clean)
      length(clean) == 11 && Enum.at(clean, 0) == "1" -> join_numbers(Enum.slice(clean, 1, 10))
      true                                   -> bad_number
    end
  end
  defp _number([head | tail], clean) when head in @numbers, do: _number(tail, clean ++ [head])
  defp _number([_ | tail], clean), do: _number(tail, clean)

  # Join a collection of binary string characters into a single string
  defp join_numbers(clean), do: Enum.reduce(clean, "", fn(char, str) -> str <> char end)

  # Make sure only digits, (, ), - and . are in the number
  defp invalid_characters?(raw) do
    Regex.match?(~r/[^\d-().\s]/, raw)
  end

  # The number to return if validations fail
  defp bad_number, do: "0000000000"

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    number(raw) |> String.slice(0, 3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    {area, num} = number(raw) |> String.split_at(3)
    {locality, line} = String.split_at(num, 3)
    "(#{area}) #{locality}-#{line}"
  end
end
