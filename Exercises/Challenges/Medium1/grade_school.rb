# grade_school.rb

class School
  attr_reader :roster
  
  def initialize
    @roster = Hash.new([])
  end
  
  def to_h
    roster.each do |grade, student|
      roster[grade] = student.sort
    end
    roster.sort.to_h
  end
  
  def add(student, grade)
    roster[grade] += [student]
  end
  
  def grade(number)
    roster[number]
  end
end
