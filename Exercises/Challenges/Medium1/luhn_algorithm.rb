# luhn_algorithm.rb

class Luhn
  
  attr_reader :number
  
  def initialize(number)
    @number = number
  end
  
  def self.create(number_given)
    0.upto(9) do |trial|
      new_number = Luhn.add_number(number_given, trial)
      return new_number if Luhn.new(new_number).valid?
    end
  end
  
  def addends
    result = change_format(number).map.with_index do |num, index|
      transform(num, index)
    end
    
    result.reverse
  end
  
  def checksum
    addends.reduce(:+)
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  private
  
  def self.add_number(list, new_addition)
    list
    .to_s
    .chars
    .map(&:to_i)
    .push(new_addition)
    .join
    .to_i
  end
  
  def change_format(input)
    input
    .to_s
    .reverse
    .chars
  end
  
  def transform(num, index)
    digit = num.to_i
    digit *= 2 unless index.even?
    if digit >= 10
      digit -= 9
    end
    digit
  end
end
