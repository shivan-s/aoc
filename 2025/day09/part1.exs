defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec execute(String) :: Integer
  def execute(path) do
    arr =
      parse_file(path)
      |> Enum.map(fn x -> String.split(x, ",") |> Enum.map(fn x -> String.to_integer(x) end) end)

    arr
    |> Enum.map(fn a ->
      arr
      |> Enum.map(fn b ->
        abs(Enum.at(a, 0) - Enum.at(b, 0) + 1) * abs(Enum.at(a, 1) - Enum.at(b, 1) + 1)
      end)
      |> Enum.max()
    end)
    |> Enum.max()
    |> IO.inspect(charlists: :as_lists)
  end
end

Aoc.Part1.execute("./sample.txt")
Aoc.Part1.execute("./data.txt")
