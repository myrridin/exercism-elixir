defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :teenth), do: find_weekday(year, month, 13, weekday, 1)
  def meetup(year, month, weekday, :first), do: find_weekday(year, month, 1, weekday, 1)
  def meetup(year, month, weekday, :second), do: find_weekday(year, month, 8, weekday, 1)
  def meetup(year, month, weekday, :third), do: find_weekday(year, month, 15, weekday, 1)
  def meetup(year, month, weekday, :fourth), do: find_weekday(year, month, 22, weekday, 1)
  def meetup(year, month, weekday, :last), do: find_weekday(year, month, :calendar.last_day_of_the_month(year, month), weekday, -1)

  defp find_weekday(year, month, day, weekday, interval) do
    if weekday_from_date(year, month, day) == weekday, do: {year, month, day}, else: find_weekday(year, month, day+interval, weekday, interval)
  end

  @weekdays %{1 => :monday, 2 =>  :tuesday, 3 =>  :wednesday, 4 =>  :thursday, 5 =>  :friday, 6 =>  :saturday, 7 =>  :sunday}
  defp weekday_from_date(year, month, day), do: @weekdays[:calendar.day_of_the_week(year, month, day)]
end
