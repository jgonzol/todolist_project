# series.rb

class Series
  attr_reader :numbers, :array_integers
  
  def initialize(numbers)
    @numbers = numbers
    @array_integers = numbers.chars.map(&:to_i)
  end
  
  def slices(sets)
    raise ArgumentError if sets > numbers.size
    array_integers.each_cons(sets).to_a
  end
end