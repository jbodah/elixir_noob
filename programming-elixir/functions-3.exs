# write a function that takes single integer n
# and calls the function in the previous exercise passing it
# rem(n, 3), rem(n, 5) and n
#
# call it seven times with args 10, 11, 12, etc

fizz_buzz = fn
  ( 0, 0, _ ) -> "FizzBuzz"
  ( 0, _, _ ) -> "Fizz"
  ( _, 0, _ ) -> "Buzz"
  ( _, _, a ) -> a
end

fizz_buzzer = fn (n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

# tests
"Buzz" = fizz_buzzer.(10)
11 = fizz_buzzer.(11)
"Fizz" = fizz_buzzer.(12)
13 = fizz_buzzer.(13)
14 = fizz_buzzer.(14)
"FizzBuzz" = fizz_buzzer.(15)
16 = fizz_buzzer.(16)

