class Say
  WORDS = {
    0 => 'zero',
    1 =>  'one',
    2 =>  'two',
    3 =>  'three',
    4 =>  'four',
    5 =>  'five',
    6 =>  'six',
    7 =>  'seven',
    8 =>  'eight',
    9 =>  'nine',
    10 =>  'ten',
    11 =>  'eleven',
    12 =>  'twelve',
    13 =>  'thirteen',
    14 =>  'fourteen',
    15 =>  'fifteen',
    16 =>  'sixteen',
    17 =>  'seventeen',
    18 =>  'eighteen',
    19 =>  'nineteen',
    20 =>  'twenty',
    30 =>  'thirty',
    40 =>  'forty',
    50 =>  'fifty',
    60 =>  'sixty',
    70 =>  'seventy',
    80 =>  'eighty',
    90 =>  'ninety',
    100 => 'hundred',
    1_000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion'
  }.freeze

  def initialize(int)
    @int = int
  end

  def in_english
    in_english_recursive(@int)
  end

  private

  def in_english_recursive(number)
    raise ArgumentError unless number.between?(0, 1_000_000_000_000 - 1)
    return simple_number(number) if WORDS[number]

    first_key_smaller_than = WORDS.keys.reverse.find { |k| k < number }
    remainder = number % first_key_smaller_than
    multiplier = number / first_key_smaller_than

    if number.between?(21, 99)
      return number_with_hyphen(first_key_smaller_than, remainder)
    end
    number_with_no_hyphen(multiplier, first_key_smaller_than, remainder)
  end

  def simple_number(number)
    return WORDS[number] if number < 100
    "one #{WORDS[number]}"
  end

  def number_with_hyphen(first_key_smaller_than, remainder)
    "#{WORDS[first_key_smaller_than]}-#{in_english_recursive(remainder)}"
  end

  def number_with_no_hyphen(multiplier, first_key_smaller_than, remainder)
    str = "#{in_english_recursive(multiplier)} #{WORDS[first_key_smaller_than]}"
    str << " #{in_english_recursive(remainder)}" unless remainder == 0
    str
  end
end
