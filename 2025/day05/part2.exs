defmodule Aoc.Part2 do
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

    fresh
    |> Enum.reduce(
      [],
      fn [a, b], acc ->
        acc ++ Enum.to_list(a..b)
      end
    )
    |> length()
    |> IO.inspect()
  end
end

Aoc.Part2.execute("./sample.txt")
Aoc.Part2.execute("./data.txt")
