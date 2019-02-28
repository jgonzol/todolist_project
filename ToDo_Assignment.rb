# This class represents a todo item and its associated data: name and description. 
# There is also a 'done' flag to show whether this todo item is done. 

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '
  
  attr_accessor :title, :description, :done
  
  def initialize(title, descripton=' ')
    @title = title
    @description = description
    @done = false
  end
  
  def done!
    self.done = true
  end
  
  def done?
    done
  end
  
  def undone!
    self.done = false
  end
  
  def to_s
    "[#{done ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects
# You can perform typical collection-oriented actions on a Todo object, including iterations and selection. 

class TodoList
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @todos = []
  end
  
  # rest of class needs implementation
  def add(todo)
    raise TypeError if todo.class != Todo
    @todos << todo
  end
  
  alias_method :<<, :add
  
  def size
    @todos.size
  end
  
  def first
    @todos[0]
  end
  
  def last
    @todos[-1]
  end
  
  def to_a
    @todos
  end
  
  def done?
    @todos.all? {|item| item.done? }
  end
  
  def item_at(index)
    @todos.fetch(index)
  end
  
  def mark_done_at(index)
    raise IndexError if @todos[index] == nil
    @todos[index].done!
  end
  
  def mark_undone_at(index)
    raise IndexError if @todos[index] == nil
    @todos[index].undone!
  end
  
  def done!
    @todos.each {|item| item.done! }
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(index)
    raise IndexError if @todos[index] == nil
    @todos.delete_at(index)
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    self
  end
  
  def select
    counter = 0
    result = TodoList.new("Today's Todos")
    while counter < @todos.size
      result << @todos[counter] if yield(@todos[counter])
      counter += 1
    end
    result
  end
  
  def find_by_title(string)
    # takes a string argument, and returns the first Todo object that 
    # matches the argument. Returns nil if none is found.
    each do |todo|
      return todo if todo.title == string
    end
  end
  
  def all_done
    # returns new TodoList object containing only the done items
    select {|todo| todo.done? }
  end
  
  def all_not_done
    # returns a new TodoList object containing only the not-done items
    select {|todo| !todo.done? }
  end
  
  def mark_done(string)
    # takes a string as an argument, and marks the first Todo object
    # that matches the argument as done
    each do |todo|
      todo.done! if todo.title == string
    end
  end
  
  def mark_all_done
    # mark every Todo as done
    each do |todo|
      todo.done!
    end
  end
  
  def mark_all_undone
    # mark every Todo as not done
    each do |todo|
      todo.undone!
    end
  end
end

