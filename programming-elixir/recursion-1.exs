defmodule MyList do
  # sum without accumulator
  def sum([]), do: 0
  def sum([ head | rest ]), do: head + sum(rest)
end

# tests
6 = MyList.sum [1,2,3]
10 = MyList.sum [1,2,3,4]
