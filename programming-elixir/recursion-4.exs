defmodule MyList do
  def span(from, to), do: _push_candidates([], from, to)

  def _push_candidates(acc, candidate, limit) when candidate > limit, do: acc

  def _push_candidates(acc, candidate, limit) when candidate <= limit do
    _push_candidates(acc ++ [ candidate ], candidate + 1, limit)
  end
end

# tests
[] = MyList.span(5, 3)
[3,4,5] = MyList.span(3, 5)
[4,5,6,7,8] = MyList.span(4, 8)
