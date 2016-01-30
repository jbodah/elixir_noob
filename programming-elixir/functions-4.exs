# write a fn that takes a tr and retursn a new fn that
# takes a second str. When inner is called it joins the
# first and second str with a space
join = fn (str_one) -> 
  fn (str_two) -> 
    "#{str_one} #{str_two}"
  end 
end

# tests
"hello world" = join.("hello").("world")
