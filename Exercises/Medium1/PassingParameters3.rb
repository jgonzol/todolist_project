

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*food, final|
  puts food.join(', ')
  puts final
end

puts ''

# 2
gather(items) do |first,*middle,last |
  puts first
  puts middle.join(', ')
  puts last
end

puts ''

# 3
gather(items) do |first, *group|
  puts first
  puts group.join(', ')
end

puts ''

# 4
gather(items) do |apple, corn, cabbage, wheat|
  puts items.join(', ')
end