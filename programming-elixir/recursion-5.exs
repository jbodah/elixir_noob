defmodule MyEnum do
  # all?(enum, fnc) #=> Boolean
  def all?([ head | tail ], fnc), do: fnc.(head) && all?(tail, fnc)
  def all?([], _),                do: true

  # each(enum, fnc) #=> enum
  def each([], _), do: []
  def each([ head | tail ], fnc) do
    fnc.(head)
    [ head | each(tail, fnc) ]
  end

  # filter
  def filter([], _), do: []
  def filter([ head | tail ], fnc) do
    truthy = fnc.(head)
    if truthy do
      [ head | filter(tail, fnc) ]
    else
      filter(tail, fnc)
    end
  end

  # split
  def split(enum, count) do
    _split(enum, [], 0, count)
  end

  defp _split([], acc, _, _), do: [acc, []]

  defp _split(rest, acc, acc_size, count) when acc_size >= count do
    [ acc, rest ]
  end

  defp _split([ head | rest ], acc, acc_size, count) when acc_size < count do
    _split(rest, acc ++ [ head ], acc_size + 1, count)
  end

  # take
  def take(enum, count) do
    _take(enum, [], 0, count)
  end

  def _take(_, acc, acc_size, count) when acc_size >= count do
    acc
  end

  def _take([], acc, _, _), do: acc

  def _take([ head | rest], acc, acc_size, count) when acc_size < count do
    _take(rest, acc ++ [ head ], acc_size + 1, count)
  end
end

# tests
true  = MyEnum.all?([1,2,3], &(&1 < 4))
false = MyEnum.all?([1,2,3,4], &(&1 < 4))
true  = MyEnum.all?([], &(&1))

[1,2,3] = MyEnum.each([1,2,3], &(&1 + 1))
MyEnum.each([1,2,3], &IO.puts/1)

[3] = MyEnum.filter [1,2,3], &(&1 > 2)
[2,3] = MyEnum.filter [1,2,3], &(&1 >= 2)
[1,2,3] = MyEnum.filter [1,2,3], &(&1 > 0)
[] = MyEnum.filter [], &(&1 > 0)

[[], []]      = MyEnum.split([], 2)
[[1], []]     = MyEnum.split([1], 2)
[[1,2], []]   = MyEnum.split([1,2], 2)
[[1,2], [3]]  = MyEnum.split([1,2,3], 2)

[]      = MyEnum.take([1,2,3], 0)
[1]     = MyEnum.take([1,2,3], 1)
[1,2]   = MyEnum.take([1,2,3], 2)
[1,2,3] = MyEnum.take([1,2,3], 3)
[1,2,3] = MyEnum.take([1,2,3], 4)
