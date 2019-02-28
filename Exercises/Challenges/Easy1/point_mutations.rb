# point_mutations.rb

class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(comparison)
    count = 0
    strand.chars.each_with_index do |tide, index|
      break if tide == nil || comparison[index] == nil
      count += 1 if tide != comparison[index]
    end
    count
  end
end