defmodule Aoc.Part2 do
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

    ops = arr |> Enum.at(-1) |> Enum.reverse()

    nums =
      arr
      |> Enum.slice(0..-2//1)
      |> Enum.map(fn n ->
        n
        |> Enum.map(fn x ->
          String.split(x, "", trim: true)
          |> Enum.reverse()
          |> Enum.join("")
          |> String.to_integer()
        end)
        |> Enum.reverse()
      end)
      |> Enum.reverse()

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

      max_length =
        operands
        |> Enum.map(fn x -> x |> Integer.digits() |> length() end)
        |> Enum.max()

      padded_operands =
        operands
        |> Enum.map(&Integer.to_string/1)
        |> Enum.map(fn x -> String.pad_leading(x, max_length) end)
        |> Enum.map(&String.split(&1, "", trim: true))
        |> IO.inspect()

      #
      cond do
        operator == "*" -> operands |> Enum.reduce(1, fn x, acc -> acc * x end)
        operator == "+" -> operands |> Enum.reduce(0, fn x, acc -> acc + x end)
      end
    end)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Aoc.Part2.execute("./sample.txt")
# Aoc.Part2.execute("./data.txt")
