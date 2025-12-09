defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec execute(String) :: Integer
  def execute(path) do
    map =
      parse_file(path)
      |> Enum.map(&String.split(&1, "", trim: true))

    start =
      map
      |> Enum.at(0)
      |> Enum.with_index()
      |> Enum.find(fn {val, _} -> val == "S" end)
      |> (fn {_, idx} -> idx end).()
      |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
# Aoc.Part1.execute("./data.txt")
