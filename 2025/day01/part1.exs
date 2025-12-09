defmodule Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec move(Integer, Integer) :: Integer
  def move(curr, n) do
    acc = curr + rem(n, 100)

    cond do
      acc < 0 -> 100 + acc
      acc > 99 -> acc - 100
      true -> acc
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
      |> Enum.reduce(50, fn {val, _}, acc -> move(acc, val) end)
    end)
    |> Enum.filter(fn x -> x == 0 end)
    |> length
    |> IO.inspect()
  end
end

Part1.execute("./sample.txt")
Part1.execute("./data.txt")
