#anagram.rb

class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word
  end
  
  def match(array)
    array.select do |possible_anagram|
      next if possible_anagram.downcase == word.downcase
      transform(word) == transform(possible_anagram)
    end
  end
  
  private
  
  def transform(word)
    word.downcase.chars.sort
  end
end