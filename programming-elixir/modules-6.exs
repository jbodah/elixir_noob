defmodule Guesser do
  def guess(actual, low..high) do
    midpoint = _get_midpoint(low, high)
    IO.puts "Could it be #{midpoint}?"
    _check_guess(actual, low..high, midpoint)
  end

  defp _get_midpoint(x, y), do: round (x + y)/2

  defp _check_guess(current_guess, _, current_guess) do
    IO.puts "It's got to be #{current_guess}!"
  end
  
  defp _check_guess(actual, _..high, current_guess) when current_guess < actual do
    IO.puts "No, it must be higher"
    guess(actual, current_guess..high)
  end

  defp _check_guess(actual, low.._, current_guess) when current_guess > actual do
    IO.puts "No, it must be lower"
    guess(actual, low..current_guess)
  end
end
