#perfect_numbers.rb

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    if number == sum_factors(number)
      'perfect'
    elsif number < sum_factors(number)
      'abundant'
    else
      'deficient'
    end
  end
  
  private
  
  def self.sum_factors(number)
    result = 1.upto(number / 2).select do |num|
      number % num == 0
    end
    result.reduce(:+)
  end
end