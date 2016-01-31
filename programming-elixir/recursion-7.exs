Code.require_file "recursion-4.exs"

defmodule Primes do
  def find_primes(upto) do
    for x <- MyList.span(2, upto), Primes.is_prime?(x), do: x
  end

  def is_prime?(x) do
    Enum.all? MyList.span(2, x - 1), &(rem(x, &1) != 0)
  end
end

# tests
[2, 3, 5, 7, 11, 13, 17, 19] = Primes.find_primes(20)
