
birds = %w(raven finch hawk eagle)

def group(array)
  yield(array)
end

group(birds) {|_,_,*raptor| puts raptor }

