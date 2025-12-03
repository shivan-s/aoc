defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec execute(String) :: Integer
  def execute(path) do
    parse_file(path)
    |> Enum.map(fn x ->
      arr = String.split(x, "", trim: true) |> Enum.with_index()
      arr1 = arr |> Enum.slice(0..-2//1)
      arr2 = arr |> Enum.slice(1..-1//1)

      arr1
      |> Enum.flat_map(fn {x, i} ->
        arr2 |> Enum.filter(fn {_, j} -> i < j end) |> Enum.map(fn {y, _} -> x <> y end)
      end)
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.max()
    end)
    |> Enum.sum()
    |> IO.inspect(charlists: :as_lists)
  end
end

Aoc.Part1.execute("./sample.txt")
Aoc.Part1.execute("./data.txt")
