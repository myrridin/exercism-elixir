defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date
  def from({year, month, day}) do
    current_seconds = :calendar.datetime_to_gregorian_seconds({{year, month, day}, {0, 0, 0}})
    {new_date, _} = :calendar.gregorian_seconds_to_datetime(current_seconds + 1_000_000_000)
    new_date
  end
end
