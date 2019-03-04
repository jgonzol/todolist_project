# clock.rb

class Clock
  attr_accessor :hours, :minutes, :total_minutes
  
  def initialize(hours, min)
    @hours = hours % 24
    @minutes = min % 60
    @total_minutes = hours * 60 + min
  end
  
  def self.at(hour, min=0)
    new(hour, min)
  end
  
  def to_s
    "%02d:%02d" % [hours, minutes]
  end
  
  def +(number)
    update!(number)
  end
  
  def -(number)
    update!(-number)
  end
  
  def ==(other)
    self.to_s == other.to_s
  end
  
  private
  
  def update!(number)
    @total_minutes += number
    @hours = (total_minutes / 60) % 24
    @minutes = total_minutes % 60
    self
  end
end
