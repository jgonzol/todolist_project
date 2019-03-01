# protein_translation

class Translation
  
  TABLE = {'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'],
           'Leucine' => ['UUA', 'UUG'], 'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
           'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
           'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA'] }
  
  def self.of_codon(rna)
    TABLE.each do |protein, possibilities|
      return protein if possibilities.include?(rna)
    end
  end
  
  def self.of_rna(strand)
    raise InvalidCodonError if strand.match(/[^ACGU]/)
    codons = []
    Translation.pack_of_codons(strand).each do |codon|
        codons << Translation.of_codon(codon)
    end
    
    Translation.result(codons)
  end
  
  private
  
  def self.pack_of_codons(letters)
    codons = []
    string = letters.chars
    loop do
      codons << string.shift(3).join
      break if string.empty?
    end
    codons
  end
  
  def self.result(strands)
    return strands.join if strands.size == 1
    adjusted = []
    strands.each do |codon|
      return adjusted if codon == 'STOP'
      adjusted << codon
    end
  end
end

class InvalidCodonError < StandardError; end
