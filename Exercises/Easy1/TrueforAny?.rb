# rewrite the Enumberable#any? method. It should take an array as an argument, and a block.
# It should return true for any of the element values. Otherwise, it should return false.
# your method should stop processing elements of the array as soon as the block returns true.
# if the array is empty, any? should return false, regardless of how block is defined. 

def any?(array)
  array.each do |element|
    return true if yield(element)
  end
  false
end




p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false