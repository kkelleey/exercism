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

  LETTER_TO_SCORE_MAP =
    SCRABBLE_VALUES.each_with_object({}) do |(value, letters), hash|
      letters.each { |letter| hash[letter] = value }
    end

  def initialize(string)
    @string = string.to_s
  end

  def score
    @string
      .scan(/[[:alpha:]]/)
      .map { |letter| LETTER_TO_SCORE_MAP[letter.upcase] }
      .reduce(:+) || 0
  end

  def self.score(string)
    new(string).score
  end
end
