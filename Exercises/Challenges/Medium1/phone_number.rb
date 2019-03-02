# phone_number.rb

class PhoneNumber
  
  BAD_NUMBER = '0000000000'

  def initialize(input)
    if input.match(/[a-zA-Z]/)
      @number = BAD_NUMBER
    elsif input.size == 11 && input[0] == '1'
      @number = input[1..-1]
    else
      @number = input.scan(/\d/).join
    end
  end
  
  def number
    return @number if @number.size == 10
    BAD_NUMBER
  end
  
  def area_code
    number[0..2]
  end
  
  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end
end