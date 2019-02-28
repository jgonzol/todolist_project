# re-write the Array#zip method. the method will take two equally-sized arrays as arguments.

def zip(array1, array2)
  result = []
  0.upto(array1.size - 1) do |index|
    result << [array1[index], array2[index]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6])

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]