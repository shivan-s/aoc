x = 1

if 1 do
  x = 2
  x |> IO.inspect(label: "inner")
end

x |> IO.inspect(label: "outer")
