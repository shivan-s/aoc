defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  def scan(map, i, j) do
    if i < 0 or j < 0 do
      0
    else
      map
      |> Enum.at(i)
      |> (fn x ->
            if x == nil do
              []
            else
              x
            end
          end).()
      |> Enum.at(j)
      |> (fn x ->
            if x == "@" do
              1
            else
              0
            end
          end).()
    end
  end

  @spec execute(String) :: Integer
  def execute(path) do
    map =
      parse_file(path)
      |> Enum.map(fn x ->
        String.split(x, "", trim: true)
      end)

    map
    |> Enum.with_index()
    |> Enum.map(fn {row, i} ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {item, j} ->
        cond do
          item == "." ->
            0 |> IO.inspect(label: "no")

          item == "@" ->
            total =
              [
                map |> scan(i - 1, j - 1),
                map |> scan(i - 1, j),
                map |> scan(i - 1, j + 1),
                map |> scan(i, j + 1),
                map |> scan(i, j - 1),
                map |> scan(i + 1, j - 1),
                map |> scan(i + 1, j),
                map |> scan(i + 1, j + 1)
              ]
              |> IO.inspect(label: "actual adjacents")
              |> Enum.sum()

            if total < 4 do
              1
            else
              0
            end
        end
        |> IO.inspect(label: "final adjacents")
      end)
      |> Enum.sum()
      |> IO.inspect(label: "Row Sum")
    end)
    |> Enum.sum()
    |> IO.inspect(charlists: :as_lists)
  end
end

Aoc.Part1.execute("./sample.txt")
Aoc.Part1.execute("./data.txt")
