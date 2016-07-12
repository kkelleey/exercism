class Poker
  def initialize(hands)
    @hands = hands.map { |cards| Hand.new(cards) }
  end

  def best_hand
    best_hand, *rest = @hands.sort.reverse
    best_hands = [best_hand] + rest.take_while { |hand| hand == best_hand }
    best_hands.map(&:cards)
  end
end

class Hand
  include Comparable
  attr_reader :cards

  CATEGORIES = %w(
    straight_flush four_of_a_kind full_house flush straight three_of_a_kind
    two_pair one_pair high_card
  ).freeze

  ROYAL_CARDS = %w(J Q K A).zip((11..14).to_a).to_h.freeze

  def initialize(cards)
    @cards = cards
  end

  def category
    CATEGORIES.find { |category| send(category + '?') }
  end

  def <=>(other)
    return rank <=> other.rank if category == other.category
    CATEGORIES.index(other.category) <=> CATEGORIES.index(category)
  end

  protected

  def rank
    grouped_values.sort.reverse.max_by(&:length).max
  end

  def grouped_values
    @grouped_values ||= card_values.group_by { |v| v }.values
  end

  def card_values
    @card_values ||= cards.map do |card|
      card[0].gsub(/[JQKA]/, ROYAL_CARDS).to_i
    end
  end

  private

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    group_of?(4)
  end

  def full_house?
    group_of?(3) && group_of?(2)
  end

  def flush?
    cards.map { |card| card[1] }.uniq.length == 1
  end

  def straight?
    card_values.sort == [2, 3, 4, 5, 14] ||
      card_values.sort.each_cons(2).all? { |v1, v2| v2 == v1 + 1 }
  end

  def three_of_a_kind?
    group_of?(3)
  end

  def two_pair?
    grouped_values.select { |group| group.length == 2 }.length == 2
  end

  def one_pair?
    group_of?(2)
  end

  def high_card?
    true
  end

  def group_of?(n)
    grouped_values.any? { |group| group.length == n }
  end
end

class BookKeeping
  VERSION = 1
end
