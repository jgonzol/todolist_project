# beer_song.rb

class BeerSong
  
  attr_accessor :verse, :last
  
  def initialize
    @verse = 99
    @last = 2
  end
  
  def lyrics
    verse.downto(last) do |number|
      puts "#{number} bottle of beer on the wall, #{number} bottles of beer."
      puts "Take one down, pass it around, #{number - 1} bottle of beer on the wall."
    end
    
    if self.last == 
  end
  
  def verse(*number)
    self.verse, self.last = number[0], number[-1]
    self.lyrics
    self.verse, self.last = 99, 2
  end
end

BeerSong.new.lyrics