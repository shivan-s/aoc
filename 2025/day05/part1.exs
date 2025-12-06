defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n")
  end

  @spec execute(String) :: Integer
  def execute(path) do
    arr = parse_file(path)

    empty_idx =
      arr
      |> Enum.with_index()
      |> Enum.filter(fn {val, _} -> String.trim(val) == "" end)
      |> Enum.map(fn {_, i} -> i end)
      |> Enum.at(0)

    fresh =
      arr
      |> Enum.slice(0..(empty_idx - 1))
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn x ->
        x |> String.split("-", trim: true) |> Enum.map(fn x -> x |> String.to_integer() end)
      end)

    arr
    |> Enum.slice((empty_idx + 1)..-1//1)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> x |> String.to_integer() end)
    |> Enum.filter(fn x ->
      fresh
      |> Enum.filter(fn y -> y |> Enum.at(0) <= x and y |> Enum.at(1) >= x end)
      |> Enum.any?()
    end)
    |> length()
    |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
Aoc.Part1.execute("./data.txt")
