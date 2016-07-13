class Hexadecimal
  def initialize(string)
    @string = string
  end

  def to_decimal
    @string =~ /[^0-9a-fA-F]/ ? 0 : @string.to_i(16)
  end
end
