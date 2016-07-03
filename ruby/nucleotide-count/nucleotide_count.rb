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
      NUCLEOTIDES.each_with_object({}) { |n, h| h[n] = count(n) }
    end
  end
end
