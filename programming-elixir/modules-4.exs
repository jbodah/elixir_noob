defmodule RecursiveMath do
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

# tests
1 = RecursiveMath.sum(1)
3 = RecursiveMath.sum(2)
6 = RecursiveMath.sum(3)
10 = RecursiveMath.sum(4)

6 = RecursiveMath.gcd(54, 24)
6 = RecursiveMath.gcd(24, 54)
12 = RecursiveMath.gcd(24, 60)
12 = RecursiveMath.gcd(60, 24)
