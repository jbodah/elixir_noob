defmodule MyStr do
  def center(strs) do
    max_size = Enum.reduce(strs, 0, fn(str, acc) -> Enum.max([String.length(str), acc]) end)
    Enum.reduce(strs, "", fn(str, acc) -> acc <> center_str(str, max_size) <> "\n" end)
  end
  
  def center_str(str, max_size) do
    pad_str str, Float.floor((max_size - String.length(str)) / 2)
  end

  def pad_str(str, 0.0), do: str

  def pad_str(str, num_spaces) do
    " " <> pad_str(str, num_spaces - 1)
  end
end

expected = """
  cat
 zebra
elephant
"""
^expected = MyStr.center(["cat", "zebra", "elephant"])
