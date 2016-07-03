class Hexadecimal
  HEX_VALUES = [*'0'..'9', *'A'..'F'].freeze

  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if invalid_hex?
    @string.chars.reverse.each_with_index.reduce(0) do |a, (char, index)|
      a + hex_value(char) * 16**index
    end
  end

  private

  def invalid_hex?
    @string =~ /[^0-9a-fA-F]/
  end

  def hex_value(char)
    HEX_VALUES.index(char.upcase)
  end
end
