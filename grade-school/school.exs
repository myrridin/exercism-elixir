defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    if students = db[grade] do
      Dict.put(db, grade, students ++ [name])
    else
      Dict.put(db, grade, [name])
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    db[grade] || []
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do
    db
      |> Enum.map(fn({grade, students}) -> {grade, Enum.sort(students)} end)
      |> Enum.into %{}
  end
end
