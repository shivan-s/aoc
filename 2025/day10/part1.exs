defmodule Aoc.Part1 do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  @spec execute(String) :: Integer
  def execute(path) do
    parse_file(path)
    |> Enum.map(fn x -> String.split(x, " ") end)
    |> Enum.map(fn x ->
      [machine | _jolt] = x
      buttons = x |> Enum.slice(1..-2//1)

      %{
        machine:
          machine
          |> (fn x -> x |> String.split("", trim: true) end).()
          |> Enum.slice(1..-2//1)
          |> Enum.map(fn x ->
            case x do
              "#" -> true
              _ -> false
            end
          end)
          |> Enum.with_index(),
        buttons:
          buttons
          |> Enum.map(fn x ->
            x
            |> (fn x -> x |> String.split("", trim: true) end).()
            |> Enum.slice(1..-2//1)
            |> Enum.join()
            |> (fn x -> x |> String.split(",", trim: true) end).()
            |> Enum.map(&String.to_integer/1)
          end)
      }
    end)
    |> IO.inspect()
  end
end

Aoc.Part1.execute("./sample.txt")
# Aoc.Part1.execute("./data.txt")
