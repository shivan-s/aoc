defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec d({Integer, Integer, Integer}, {Integer, Integer, Integer}) :: Float
  def d(a, b) do
    :math.sqrt(
      :math.pow((a |> Enum.at(0)) - (b |> Enum.at(0)), 2) +
        :math.pow((a |> Enum.at(1)) - (b |> Enum.at(1)), 2) +
        :math.pow((a |> Enum.at(2)) - (b |> Enum.at(2)), 2)
    )
  end

  @spec execute(String) :: Integer
  def execute(path) do
    arr =
      parse_file(path)
      |> Enum.map(fn x -> String.split(x, ",") |> Enum.map(&String.to_integer/1) end)
      |> Enum.with_index()
      |> IO.inspect()

    pairs =
      arr
      |> Enum.map(fn {a, i} ->
        arr
        |> Enum.map(fn {b, j} -> {d(a, b), i, j} end)
        |> Enum.filter(fn {d, _, _} -> d != 0 end)
        |> Enum.sort_by(fn {d, _, _} -> d end, :asc)
        |> Enum.at(0)
      end)
      |> Enum.map(fn {_, i, j} -> {i, j} end)

    pairs
    # Stuck on pairs but don't know how to link the together
    |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
# Aoc.Part1.execute("./data.txt")
