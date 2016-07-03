class Nucleotide
  EMPTY_HISTOGRAM = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0
  }.freeze

  def self.from_dna(string)
    raise ArgumentError if string =~ /[^ATCG]/
    @string = string
    self
  end

  def self.count(nucleotide)
    @string.scan(nucleotide).count
  end

  def self.histogram
    @string.chars.each_with_object(EMPTY_HISTOGRAM.dup) do |char, histogram|
      histogram[char] += 1
    end
  end
end
