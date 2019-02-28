

def factorial(integer)
  (1..integer).to_a.inject(:*)
end


p factorial(10)
