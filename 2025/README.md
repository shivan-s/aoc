# [Advent of Code 2025](https://adventofcode.com/2025)

I am doing this in [Elixir](https://elixir-lang.org).

## Progress

- Day 1 ⭐
- Day 2 ⭐
- Day 3 ⭐
- Day 4 ⭐
- Day 5 ⭐
- Day 6 ⭐
- Day 7
- Day 8
- Day 9 ⭐
- Day 10
- Day 11
- Day 12

## [Elixir](https://elixir-lang.org/)

### About

- Created by [@josevalim](https://github.com/josevalim) in ~2012
- Built on top of erlang VM
- The functional paradigm
- Immutability

### Tooling

- Didn't give deep into this:
- but there is a LSP,
- `mix` is a build tool,
- `elixir` to compile scripts (`.exs`; `.ex` compiles), and
- `iex` for REPL

### Syntax

#### Pipe Operator `|>`

In life all we do is take data in, process it, and send it out.

Similar to Javascript method chaining when we process data.

```ts
> const nums = [1, 2, 3, 4]
> const nums2 = nums.map((x)=> x + 1).filter((x)=> x % 2 == 0)
[2, 4]
> const nums3 = nums2.reverse() // Oops!
[4, 2]
```

```elixir
> nums = [1, 2, 3, 4]
> nums2 = list |> Enum.map(fn x -> x + 1 end) |> Enum.filter(fn x -> rem(x, 2) == 0 end)
[2, 4]
> nums3 = num2 |> Enum.reverse()
[4, 2]
```

The pipe operator is like a syntactic sugar to add to the first argument.

For example you can either do:

```elixir
> list = [1, 2, 3, 4]
> Enum.map(list, fn n -> Integer.to_string(n) end)
["1", "2", "3", "4"]
# Or
> list |> Enum.map(fn n -> n |> Integer.toString() end)
# Or even
> list |> Enum.map(&Integer.toString\\1)
```

#### Function do no need `return`

Take a look at Javascript, we need to return explicitly.

```ts
function divideOrNull(num: number, dem: number): number | null {
  if (b === 0) {
    return null;
  }
  return a / b;
}
```

We can also show the documentation annotation for functions, and on top of that, we see a case for pattern matching.

```elixir
@type MaybeFloat :: Float | None
@spec divideOrNull(Integer, Integer) :: MaybeFloat
def divideOrNull(a, b) do
    case b do
        0 -> None
        _ -> a / b
    end
end
```

#### Lists are Linked lists

```ts
> const l = [1, 2, 3, 4]
> const [head, ...rest] = l
> head
1
> rest
[2, 3, 4]
```

```elixir
> l = [1, 2, 3, 4]
> [head | tail] = l
[1, 2, 3, 4]
> head
1
> tail
[2, 3, 4]
```

#### No `for` or `while` loops

This achieved using Enum's `map`, `reduce`.

```js
let i = 0;
let total = 0;
const nums = [1, 2, 3, 4];
while (i < nums.length) {
  total += nums[i];
  i++;
}

// or
total2 = 0;
for (j = 0; i <= nums.length; j++) {
  total2 += nums[j];
}
```

```elixir
nums = [1, 2, 3, 4]
nums |> Enum.reduce(0, fn x, acc -> acc + x end)

```

#### Immutable

Variables are rebound. Think of variables being names rather than an address pointing to memory. Every time an assignment is made, a label is created for a new space in memory.

```python
x = 1
if True:
    x = 2
print(x) # 2
```

```js
let x = 1;
if (true) {
  x = 2;
}
console.log(x); // 2
```

```js
const x = 1;
if (true) {
  const x = 2;
  console.log(x); // 2
}
console.log(x); // 1
```

```elixir
x = 1

if 1 do
  x = 2
  x |> IO.inspect(label: "inner") # inner: 2
end

x |> IO.inspect(label: "outer") # outer: 1
```
