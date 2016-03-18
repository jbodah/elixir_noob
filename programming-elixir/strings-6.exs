defmodule MyStr do
  def capitalize_sentences(str) do
    each_sentence(str) |> Enum.map(&capitalize_sentence/1) |> join(". ")
  end

  def join(str_list, char) do
    str_list 
    |> Enum.map(&to_string/1) 
    |> Enum.reduce("", &(_join(&1, &2, char)))
  end

  def _join(new, rest, _) when rest == "", do: new
  def _join(new, rest, separator), do: rest <> separator <> new

  def each_sentence(str) do
    String.split(str, ". ")
  end

  def capitalize_sentence(str) do
    String.to_char_list(str) |> _capitalize_sentence
  end

  def _capitalize_sentence([]), do: []

  def _capitalize_sentence([ head | rest ]) do
    [ upcase(head) | downcase_list(rest) ]
  end

  def upcase(char) when char in 97..122, do: char - 32
  def upcase(char),                      do: char

  def downcase_list([ head | rest ]) do
    [ downcase(head) | downcase_list(rest) ]
  end

  def downcase_list([]), do: []

  def downcase(char) when char in 65..90, do: char + 32
  def downcase(char),                     do: char
end

"Oh. A dog. Woof. " = MyStr.capitalize_sentences("oh. a DOG. woof. ")
