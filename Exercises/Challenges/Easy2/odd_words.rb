# odd_words.rb

def odd_words(string)
  string = string.gsub(/[^A-Za-z]/, ' ')
  result = string.split.map.with_index do |word, index|
    if index.odd?
      word.reverse
    else
      word
    end
  end
  result.join(' ') + '.'
end


p odd_words('hello world.')
p odd_words('hello world . ')
p odd_words('hello   world  .  ')
p odd_words('hello world   .')
p odd_words('hello word world .')