# write function takes 3 args
# if first 2 == 0 => FizzBuzz
# if first == 0 => Fizz
# if second == 0 => Buzz
# else return third arg
fizz_buzz = fn
  ( 0, 0, _ ) -> "FizzBuzz"
  ( 0, _, _ ) -> "Fizz"
  ( _, 0, _ ) -> "Buzz"
  ( _, _, a ) -> a
end

# tests
"FizzBuzz" = fizz_buzz.(0, 0, 4)
"Fizz" = fizz_buzz.(0, 3, 4)
"Buzz" = fizz_buzz.(2, 0, 4)
4 = fizz_buzz.(2, 3, 4)
