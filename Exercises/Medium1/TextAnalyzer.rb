



class TextAnalyzer
  def process
    file = File.open('Sampletext.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts text.split("\n") }
#analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
#analyzer.process { |text| puts "#{text.split("\n").count} lines" }
#analyzer.process { |text| puts "#{text.split(' ').count} words" }

