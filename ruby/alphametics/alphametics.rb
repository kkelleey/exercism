class String
  def to_number(map)
    gsub(/[a-zA-Z]/, map).to_i
  end
end

class Alphametics
  WORD_OPERATOR_REST_REGEX = /
                              (?<word>[a-zA-Z]+)
                              \s?
                              (?<operator>[*+])?
                              \s?
                              (?<rest>.+)?
                            /x

  def solve(string)
    @string = replace_exponent(string)

    (0..9).to_a.combination(uniq_chars.length) do |combination|
      combination.permutation do |permutation|
        map = uniq_chars.zip(permutation).to_h
        next if words.any? { |w| map[w[0]] == 0 }
        return map if puzzle_solved?(map)
      end
    end
    nil
  end

  private

  def words
    @words ||= @string.scan(/[A-Za-z]+/)
  end

  def uniq_chars
    @string.scan(/[A-Za-z]/).uniq
  end

  def puzzle_solved?(map)
    left_side, right_side = @string.split('==')
    value_of(right_side, map) == value_of(left_side, map)
  end

  def value_of(string, map)
    match = string.strip.match(WORD_OPERATOR_REST_REGEX)
    value_of_word = match['word'].to_number(map)
    return value_of_word if match['operator'].nil?
    value_of_rest_of_string = value_of(match['rest'], map)
    value_of_word.send(match['operator'], value_of_rest_of_string)
  end

  def replace_exponent(string)
    return string unless string.include? '^'
    base = string.scan(/(\w+)\s?\^/)[0][0]
    exponent = string.scan(/\^\s?(\d)/)[0][0].to_i
    string.gsub(/\w+\s?\^\s?\d/, ([base] * exponent).join(' * '))
  end
end

class BookKeeping
  VERSION = 2
end
