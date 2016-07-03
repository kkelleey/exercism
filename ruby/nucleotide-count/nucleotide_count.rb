class Nucleotide
  NUCLEOTIDES = %w(A T C G).freeze

  class << self
    def from_dna(string)
      raise ArgumentError if string =~ /[^#{NUCLEOTIDES.join}]/
      @string = string
      self
    end

    def count(nucleotide)
      @string.scan(nucleotide).count
    end

    def histogram
      NUCLEOTIDES.map { |nucleotide| [nucleotide, count(nucleotide)] }.to_h
    end
  end
end
