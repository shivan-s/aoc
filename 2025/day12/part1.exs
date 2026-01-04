defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec execute(String) :: Integer
  def execute(path) do
    # Shapes 
    s = 5
    # Height
    h = 3
    s_idx = (h + 1) * (s + 1)

    arr =
      parse_file(path)

    shapes = arr |> Enum.slice(0..(s_idx - 1)) |> Enum.with_index()
    # FIXME
    shapes
    |> Enum.reduce(%{}, fn {val, _}, acc ->
      cond do
        acc[val]
      end
    end)
    |> IO.inspect()

    space =
      arr
      |> Enum.slice(s_idx..-1//1)
      |> Enum.map(fn x ->
        [head, tail] =
          x |> String.split(":", trim: true)

        [
          head |> String.split("x", trim: true) |> Enum.map(&String.to_integer/1),
          tail |> String.split(" ", trim: true) |> Enum.map(&String.to_integer/1)
        ]
      end)
      |> IO.inspect()
  end
end

# Test

Aoc.Part1.execute("./sample.txt")
