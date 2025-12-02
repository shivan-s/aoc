defmodule Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec move({Integer, Integer}, Integer) :: {Integer, Integer}
  def move(pos, n) do
    clicks = abs(div(n, 100))
    acc = pos + rem(n, 100)

    cond do
      acc == 0 -> {acc, clicks + 1}
      acc < 0 -> {100 + acc, clicks + 1}
      acc > 99 -> {acc - 100, clicks + 1}
      true -> {acc, clicks}
    end
  end

  @spec execute(String) :: Integer
  def execute(path) do
    arr =
      parse_file(path)
      |> Enum.map(fn x ->
        direction = String.first(x)
        magnitude = String.to_integer(String.slice(x, 1..-1//1))

        cond do
          direction == "R" -> magnitude
          direction == "L" -> -1 * magnitude
        end
      end)
      |> Enum.with_index()

    arr
    |> Enum.map(fn {_, idx} ->
      arr
      |> Enum.slice(0..idx)
      |> Enum.reduce({50, 0}, fn {val, _}, {pos, _} -> move(pos, val) end)
    end)
    |> Enum.map(fn {_, clicks} -> clicks end)
    |> IO.inspect()
    |> Enum.sum()
  end
end

# Part1.execute("./sample.txt") |> IO.puts()
Part1.execute("./data.txt") |> IO.puts()
