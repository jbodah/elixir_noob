defmodule MyList do
  def max([]), do: nil
  def max([ candidate | rest ]), do: _max(rest, candidate)

  def _max([], candidate), do: candidate

  def _max([ contender | rest ], candidate) when contender > candidate do
    _max(rest, contender)
  end

  def _max([ contender | rest ], candidate) when contender <= candidate do
    _max(rest, candidate)
  end
end

# tests
3 = MyList.max([1, 2, 3])
3 = MyList.max([3, 2, 1])
3 = MyList.max([2, 3, 1])
nil = MyList.max([])
