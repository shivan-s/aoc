defmodule Aoc.Part2 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split(",", trim: true)
    |> Enum.map(fn x -> String.trim(x) end)
  end

  @spec matcher(Integer) :: Boolean
  def matcher(n) do
    arr = Integer.to_string(n) |> String.split("", trim: true)
    l = arr |> length()
    half_idx = (l / 2) |> ceil()
    first = arr |> Enum.slice(0..(half_idx - 1))
    second = arr |> Enum.slice(half_idx..-1//1)
    first === second
  end

  @spec execute(String) :: Integer
  def execute(path) do
    parse_file(path)
    |> Enum.map(fn x ->
      [head, tail] =
        String.split(x, "-")
        |> Enum.map(fn x -> String.to_integer(x) end)

      nums = Enum.to_list(head..tail)

      nums
      |> Enum.filter(fn x -> matcher(x) end)
      |> Enum.sum()
    end)
    |> Enum.sum()
    |> IO.inspect(charlists: :as_lists)
  end
end

Aoc.Part2.execute("./sample.txt")
Aoc.Part2.execute("./data.txt")
