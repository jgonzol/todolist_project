# write a method that takes an optional block. If the block is specified, 
# the method should execute it, and return the value returned by the block.
# if no block is specified, the method should return the string 'Does not compute.'

def compute
  return yield if block_given?
  
  'Does not compute.'
end


p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'