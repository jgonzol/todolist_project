def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}




=begin
Group 1 - Proc objects can be saved in variables. They are of the Proc class. 
They can take arguments, however, if the wrong number of arguments is passed, no error is raised.
A new proc can be created with a call of proc instead of using Proc.new

Group 2 - There are a couple of ways that we can initiate Lambdas. Either lambda or ->. Lambdas are similar to Procs. However, lambdas
are more strict about how many arguments passed in. If the incorrect amount is passed in, an error is raised. 

Group 3 - When yield is in a method definition, it will raise an error is no block is passed into it. using 
block_given? will make the method more flexible for taking a block or not taking a block.

Group 4 - yield will send arguments to the block. If the block takes the arguments, it can use them.
If too many arguments are sent to the block, the other arguments will be nil. If arguments are sent to the block,
the block needs to initialize the variables representing the arguments so that it can use them.

=end