# word_count.rb

class Phrase
  attr_accessor :count
  attr_reader :words
  
  def initialize(words)
    @words = words.scan(/\b[\w']+\b/)
  end 
  
  def word_count
    words.each_with_object(Hash.new(0)) do |word, count|
      count[word.downcase] += 1
    end
  end 
end