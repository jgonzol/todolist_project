# the Range#step method lets you iterate over a range of values where each value in the iteration
# is the previous value plus a 'step' value. It returns the original range.
# write a method that does the same thing, but does not operate on a range. Instead, your method
# should take 3 arguments: starting value, ending value, and the step value to be applied to each iteration.
# Your method should also take a block to which it will yield (or call) successive iteration values.

def step(first, last, interval)
  number = first
  array = [number]
  loop do
    number += interval
    array << number
    break if number == last
  end
  array.each do |num|
    yield(num)
  end
  nil
end




step(1, 10, 3) { |value| puts "value = #{value}" }
step(1, 26, 5) { |value| puts "value = #{value}" }
