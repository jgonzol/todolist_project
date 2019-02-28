# scrabble_score.rb

class Scrabble
  
  SCORES_TABLE = { 1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
                   2 => ['d', 'g'],
                   3 => ['b', 'c', 'm', 'p'], 
                   4 => ['f', 'h', 'v', 'w', 'y'],
                   5 => ['k'],
                   8 => ['j', 'x'],
                   10 => ['q', 'z']
  }
  
  def initialize(word)
    @word = word
  end
  
  def score
    return 0 if @word == nil || @word.include?(' ')
     array = @word.downcase.chars.map do |letter|
       SCORES_TABLE.map do |key, value|
         key if value.include?(letter)
       end
     end
     return 0 if array.empty?
     array.flatten.compact.inject(:+)
  end
  
  def self.score(word)
    new_word = Scrabble.new(word)
    new_word.score
  end
end
