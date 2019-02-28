# trinary.rb

class Trinary
  attr_reader :number
  
  def initialize(number)
    @number = number
  end
  
  def to_decimal
    return 0 if invalid?
    calculate
  end
  
  private
  
  def calculate
    number
    .chars
    .map(&:to_i)
    .map
    .with_index do |num, index|
      num * 3 ** (number.size - index - 1)
    end
    .reduce(:+)
  end
  
  def invalid?
    number.match(/[^0-2]/)
  end
end
