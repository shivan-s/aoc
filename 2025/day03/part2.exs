defmodule Aoc.Part2 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec scan([String], String, Integer) :: Integer
  def scan(arr, num, depth) do
    max = 12
    depth |> IO.inspect()

    cond do
      depth < max ->
        arr
        |> Enum.slice(depth..(depth - max)//1)
        |> Enum.flat_map(fn {x, i} ->
          arr
          |> Enum.slice((depth + 1)..(depth - max + 1)//1)
          |> Enum.filter(fn {_, j} -> i < j end)
          |> Enum.map(fn {y, _} ->
            new_num = num <> x <> y
            new_depth = depth + 1
            scan(arr, new_num, new_depth)
          end)
        end)

      depth >= max ->
        num
    end
  end

  @spec execute(String) :: Integer
  def execute(path) do
    parse_file(path)
    |> Enum.map(fn x ->
      arr = String.split(x, "", trim: true) |> Enum.with_index()

      scan(arr, "", 0)
      |> IO.inspect()
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.max()
    end)
    |> Enum.sum()
    |> IO.inspect(charlists: :as_lists)
  end
end

Aoc.Part2.execute("./sample.txt")
Aoc.Part2.execute("./data.txt")
