# write a method that takes a sorted array of integers as an argument, and returns an array
# that includes all the missing integers (in order) between the first and last elements of the argument.

def missing(array)
  array[0].upto(array[-1]).select do |num|
    !array.include?(num)
  end
end
    


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []