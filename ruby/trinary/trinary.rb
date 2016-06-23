module StringMethods
  refine String do
    def reverse_with_index
      chars.reverse.each_with_index
    end
  end
end

class Trinary
  using StringMethods

  def initialize(str)
    @string = str
  end

  def to_decimal
    return 0 if @string =~ /[^012]/
    @string.reverse_with_index.reduce(0) do |a, (char, index)|
      a + char.to_i * 3**index
    end
  end
end
