defmodule Times do
  def double(x), do: x * 2
  def triple(x), do: x * 3
  def quadruple(x), do: double double(x)
end

# tests
6 = Times.triple(2)
9 = Times.triple(3)
12 = Times.triple(4)

8 = Times.quadruple(2)
12 = Times.quadruple(3)
16 = Times.quadruple(4)
