class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @palindromes = []
    @min_factor.upto(@max_factor).each do |factor|
      add_palindromes_for(factor)
    end
  end

  def largest
    @palindromes.last
  end

  def smallest
    @palindromes.compact.first
  end

  private

  def add_palindromes_for(factor)
    @min_factor.upto(factor).each do |other_factor|
      product = factor * other_factor
      next unless palindromic?(product)
      @palindromes[product] ||= Palindrome.new(product, [])
      @palindromes[product][:factors] << [factor, other_factor].sort
    end
  end

  def palindromic?(number)
    number.to_s == number.to_s.reverse
  end
end
