defmodule Utils do
  @spec parse_file(String) :: Array
  def parse_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end
end
