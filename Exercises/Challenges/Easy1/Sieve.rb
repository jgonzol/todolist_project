# Sieve.rb

class Sieve
  def initialize(max)
    raise ArgumentError, 'input has to be greater than 1.' if max < 2
    @max = max
    @array = (2..max).to_a
  end
  
  def primes
    array = @array.clone
    
    array.each do |num|
      next if num.abs2 > @max
      num.abs2.step(@max, num) {|number| array.delete(number) }
    end
  end
end
