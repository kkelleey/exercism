class FoodChain
  def self.song
    food_chain_str = ''
    previous = nil
    Animal.all.reduce('') do |a, e|
      e.previous = previous
      previous = e

      a += e.first_two_lines
      break(a) if e.name == 'horse'
      food_chain_str = e.food_chain_line + food_chain_str
      a + food_chain_str
    end
  end
end

class Animal
  attr_reader :name, :phrase
  attr_accessor :previous

  NAME_PHRASE_MAP = {
    'fly' => "I don't know why she swallowed the fly. Perhaps she'll die.",
    'spider' => 'It wriggled and jiggled and tickled inside her.',
    'bird' => 'How absurd to swallow a bird!',
    'cat' => 'Imagine that, to swallow a cat!',
    'dog' => 'What a hog, to swallow a dog!',
    'goat' => 'Just opened her throat and swallowed a goat!',
    'cow' => "I don't know how she swallowed a cow!",
    'horse' => "She's dead, of course!"
  }.freeze

  def initialize(name, phrase)
    @name = name
    @phrase = phrase
  end

  def self.all
    NAME_PHRASE_MAP.map { |name, phrase| Animal.new(name, phrase) }
  end

  def first_two_lines
    "I know an old lady who swallowed a #{name}.\n" \
      "#{phrase}\n"
  end

  def food_chain_line
    case name
    when 'bird' then bird_phrase
    when 'fly' then phrase + "\n\n"
    else default_phrase
    end
  end

  private

  def bird_phrase
    'She swallowed the bird to catch the spider that wriggled and jiggled ' \
    "and tickled inside her.\n"
  end

  def default_phrase
    "She swallowed the #{name} to catch the #{previous.name}.\n"
  end
end

class BookKeeping
  VERSION = 2
end
