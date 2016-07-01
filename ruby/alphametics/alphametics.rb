require 'pry'

class Fixnum
  def operator(other, operator)
    case operator
    when '+' then self + other
    when '*' then self * other
    end
  end
end

class Alphametics
  EQUATION_REGEX = /([A-Za-z]+)\s([\+\*])\s(\w+)\s==\s(\w+)/

  def solve(string)
    @string = string
    replace_exponent if @string.include?('^')

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
    first_word = string[/\w+/]
    first_operator = string[/[*+]/]
    return to_number(first_word, map) unless first_operator
    rest_of_string = string[string.index(first_operator) + 1..-1]
    value_of_rest_of_string = value_of(rest_of_string, map)
    to_number(first_word, map).operator(value_of_rest_of_string, first_operator)
  end

  def replace_exponent
    word = @string.scan(/(\w+)\s?\^/)[0][0]
    exponent = @string.scan(/\^\s?(\d)/)[0][0].to_i
    @string.gsub!(/\w+\s?\^\s?\d/, ([word] * exponent).join(' * '))
  end

  def to_number(word, map)
    word.chars.map { |char| map[char].to_s }.join.to_i
  end
end

class BookKeeping
  VERSION = 2
end
