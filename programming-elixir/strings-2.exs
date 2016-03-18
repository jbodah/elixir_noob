defmodule MyString do
  def anagram?(str, str2) do
    map_chars(str) == map_chars(str2)
  end

  def map_chars(str) do
    str
    |> String.to_char_list
    |> Enum.reduce(Map.new, &map_char/2)
  end

  def map_char(char, map) do
    Map.put(map, char, (Map.get(map, char) || 0) + 1)
  end
end

true = MyString.anagram? "hello world", "owher llold"
false = MyString.anagram? "hello jorld", "owher llold"
