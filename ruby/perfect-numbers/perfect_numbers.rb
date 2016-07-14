class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number.negative?
    factors = factors_for(number)
    sum_of_factors = factors.reduce(:+)

    return 'deficient' if sum_of_factors < number
    return 'perfect' if sum_of_factors == number
    'abundant'
  end

  def self.factors_for(number)
    (1...number).select { |n| number % n == 0 }
  end
end

class BookKeeping
  VERSION = 1
end
