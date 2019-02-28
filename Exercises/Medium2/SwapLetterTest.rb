
require 'minitest/autorun'

require_relative 'Text'

class SwapLetterTest < Minitest::Test
  def setup
    @file1 = File.open('SwapLetter.txt', 'r')
  end
  
  def test_swap
    text = Text.new(@file1.read)
    
    actual_text = text.swap('a', 'e')
    expected_text = <<~OUTPUT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    OUTPUT
    
    assert_equal actual_text, expected_text
  end
  
  def test_word_count
    text = Text.new(@file1.read)
    
    count = text.word_count
    
    assert_equal count, 72
    
  end
  
  def teardown
    @file1.close
    puts "File has been closed: #{@file1.closed?}"
  end
end