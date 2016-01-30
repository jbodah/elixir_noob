defmodule MyList do
  def mapsum(list, fnc), do: map(list, fnc) |> sum

  # map(list, fnc(el))
  def map([], _), do: []
  def map([ head | rest ], fnc), do: [ fnc.(head) | map(rest, fnc) ]

  # reduce(list, memo, fnc(el, memo))
  def reduce([], acc, _), do: acc
  def reduce([ head | rest ], acc, fnc), do: reduce(rest, fnc.(head, acc), fnc)

  # sum(list)
  def sum(list), do: reduce(list, 0, &(&1 + &2))
end

# tests
2 + 4 + 6 = MyList.mapsum [1,2,3], &(&1 + &1)
1 + 4 + 9 = MyList.mapsum [1,2,3], &(&1 * &1)
