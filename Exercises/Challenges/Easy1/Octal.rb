# Octal.rb

class Octal
  INVALID_OCTAL = /\D|[8-9]/
  
  def initialize(digits)
    @digits = digits
  end
  
  def to_decimal
    @digits =~ INVALID_OCTAL ? 0 : calculate
  end
  
  private
  
  def calculate
    numbers = @digits.chars.map(&:to_i)
    numbers
    .map
    .with_index do |num, index|
      num * 8 ** (numbers.size - index - 1)
    end
    .reduce(:+)
  end
end