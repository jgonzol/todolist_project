# nth_prime.rb

class Prime
  def self.nth(number)
   raise ArgumentError if number < 1
   counter = 1
   integer = 2
   until counter == number
    integer += 1
    counter += 1 if is_prime?(integer)
   end
    integer
  end
  
  def self.is_prime?(number)
    factors = 0
    2.upto(number) do |integer|
      factors += 1 if number % integer == 0
      return false if factors > 1
    end
    true
  end
end