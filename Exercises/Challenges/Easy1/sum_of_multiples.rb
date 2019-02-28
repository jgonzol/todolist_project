# sum_of_multiples.rb

class SumOfMultiples
  attr_reader :numbers
  
  DEFAULT = [3,5]
  
  def initialize(*numbers)
    @numbers = numbers
  end
  
  def to(limit)
    numbers.nil? ? nums = DEFAULT : nums = numbers

    SumOfMultiples.calculate(nums, limit)
  end
  
  def self.to(limit)
    SumOfMultiples.calculate(DEFAULT, limit)
  end
  
  private
  
  def self.numbers_to_add(number, limit)
    array = []
    increment = number
    loop do
      array << increment
      increment += number
      break if increment >= limit
    end
    array
  end
  
  def self.add_multiples(array)
    return 0 if array.empty?
    array.flatten.uniq.reduce(:+)
  end

  def self.calculate(input, limit)
    array = []
    input.each do |number|
      next if number > limit
      array << SumOfMultiples.numbers_to_add(number, limit)
    end
    SumOfMultiples.add_multiples(array)
  end
end
