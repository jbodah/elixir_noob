list_concat = fn (list_one, list_two) -> list_one ++ list_two end
sum = fn (one, two, three) -> one + two + three end
pair_tuple_to_list = fn (tuple) -> Tuple.to_list(tuple) end

# tests
[:a, :b, :c, :d] = list_concat.([:a, :b], [:c, :d])
6 = sum.(1, 2, 3)
[1234, 5678] = pair_tuple_to_list.({ 1234, 5678 })
