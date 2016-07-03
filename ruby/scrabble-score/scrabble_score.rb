class Scrabble
  SCRABBLE_VALUES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }.freeze

  def initialize(string)
    @string = string.to_s
  end

  def score
    map = letter_to_score_map
    @string
      .scan(/[[:alpha:]]/)
      .map { |letter| map[letter.upcase] }.reduce(:+) || 0
  end

  def self.score(string)
    new(string).score
  end

  private

  def letter_to_score_map
    SCRABBLE_VALUES.each_with_object({}) do |(value, letters), hash|
      letters.each { |letter| hash[letter] = value }
    end
  end
end
