defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  def traverse() do
  end

  @spec execute(String) :: Integer
  def execute(path) do
    map =
      parse_file(path)
      |> Enum.map(fn x -> x |> String.split(":") end)
      |> Enum.map(fn x ->
        [head | [tail]] = x
        [head, tail |> String.split(" ", trim: true)]
      end)
      |> Map.new(fn [k, v] -> {k, v} end)
      |> IO.inspect()

    map["you"] |> Enum.map(fn x -> Enum.reduce([], fn x -> map[""] end) end)

    # Enum.map(fn x -> x |> String.split(" ", trim: true) end) |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
# Aoc.Part1.execute("./data.txt")
