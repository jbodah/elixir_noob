defmodule MyMod do
  # adds n to each character in list, wrapping if greater than z
  def caesar(list, n), do: Enum.map(list, fn(el) -> shift_char(el, n) end)

  def shift_char(char, n) when char + n > 122 do
    overflow = (char + n) - 122
    96 + overflow
  end

  def shift_char(char, n) when char + n <= 122 do
    char + n
  end
end

# tests
'bbb' = MyMod.caesar('aaa', 1)
'bcd' = MyMod.caesar('abc', 1)
'aaa' = MyMod.caesar('zzz', 1)
'bbb' = MyMod.caesar('zzz', 2)
'elixir' = MyMod.caesar('ryvkve', 13)
