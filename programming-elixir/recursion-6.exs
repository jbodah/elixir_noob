defmodule MyList do
  def flatten(list), do: _flatten(list, [])

  def _flatten(list, acc) when is_list(list) do
    Enum.reduce(list, acc, &_flatten/2)
  end

  def _flatten(el, acc), do: acc ++ [el]
end

# test
[1,2,3,4,5,6] = MyList.flatten([1, [2, 3, [4]], 5, [[6]]])
