defmodule TI83 do
  def calculate(list) do
    _calculate([], list)
  end

  def _calculate(left, [ ?+ | right ]) do
    String.to_integer(to_string left) + String.to_integer(to_string right)
  end

  def _calculate(left, [ ?* | right ]) do
    String.to_integer(to_string left) * String.to_integer(to_string right)
  end

  def _calculate(left, [ ?/ | right ]) do
    String.to_integer(to_string left) / String.to_integer(to_string right)
  end

  def _calculate(left, [ char | right]) do
    _calculate(left ++ [char], right)
  end
end

150 = TI83.calculate('123+27')
6   = TI83.calculate('2*3')
5   == TI83.calculate('10/2')
