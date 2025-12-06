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
      |> Enum.map(fn x -> x |> String.split(" ", trim: true) end)

    ops = arr |> Enum.at(-1)

    nums =
      arr
      |> Enum.slice(0..-2//1)
      |> Enum.map(fn n ->
        n |> Enum.map(fn x -> x |> String.to_integer() end)
      end)

    rows = Enum.to_list(0..(length(nums) - 1))
    cols = Enum.to_list(0..(length(nums |> Enum.at(0)) - 1))

    cols
    |> Enum.map(fn c ->
      operator = ops |> Enum.at(c)

      operands =
        rows
        |> Enum.map(fn r ->
          nums |> Enum.at(r) |> Enum.at(c)
        end)

      cond do
        operator == "*" -> operands |> Enum.reduce(1, fn x, acc -> acc * x end)
        operator == "+" -> operands |> Enum.reduce(0, fn x, acc -> acc + x end)
      end
    end)
    |> IO.inspect()
    |> Enum.sum()
    |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
Aoc.Part1.execute("./data.txt")
