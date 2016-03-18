defmodule MyString do
  def contains_only_printable_ascii?([]), do: true
  def contains_only_printable_ascii?([ char | rest ]) do
    Enum.member?(?\s..?~, char) && contains_only_printable_ascii?(rest)
  end
end

true = MyString.contains_only_printable_ascii? 'hello'
true = MyString.contains_only_printable_ascii? ' hello ~'
false = MyString.contains_only_printable_ascii? [0]
false = MyString.contains_only_printable_ascii? 'hello' ++ [0]
