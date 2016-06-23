require 'pry'

class Game
  def initialize
    @current_frame = Frame.new(0)
    @finished_frames = []
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' unless pins.between?(0, 10)
    raise 'Should not be able to roll after game is over' if game_over?
    add_roll(pins)
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless game_over?
    @finished_frames.reduce(0) { |a, e| a + e.score(@finished_frames) }
  end

  private

  def game_over?
    @finished_frames.length == 10
  end

  def add_roll(pins)
    @current_frame.add_roll(pins)
    if @current_frame.finished?
      @finished_frames << @current_frame
      @current_frame = Frame.new(@current_frame.index + 1)
    end
  end
end

class Frame
  attr_reader :rolls, :index

  def initialize(index)
    @index = index
    @rolls = []
  end

  def add_roll(pins)
    check_pin_count(pins)
    @rolls << pins
  end

  def finished?
    return false if @rolls.empty?
    if tenth_frame?
      tenth_frame_finished?
    else
      @rolls.length == 2 || strike?
    end
  end

  def score(all_frames)
    return strike_score(all_frames) if strike?
    return spare_score(all_frames) if spare?
    open_score
  end

  def strike?
    first_throw == 10
  end

  def first_throw
    @rolls.first
  end

  def tenth_frame?
    @index == 9
  end

  private

  def check_pin_count(pins)
    raise 'Pin count exceeds pins on the lane' if pins > remaining_pins
  end

  def remaining_pins
    return 10 if @rolls == [10, 10] || spare?
    return 10 - @rolls[1] if @rolls[1] && strike?
    10 - @rolls.first.to_i
  end

  def strike_score(all_frames)
    return @rolls.reduce(:+) if tenth_frame?
    10 + next_two_throws(all_frames)
  end

  def next_two_throws(all_frames)
    next_frame = all_frames[@index + 1]
    first_throw = next_frame.first_throw
    second_throw = if next_frame.strike? && !next_frame.tenth_frame?
                     all_frames[@index + 2].first_throw
                   else
                     next_frame.rolls[1]
                   end
    first_throw + second_throw
  end

  def open_score
    @rolls.reduce(:+)
  end

  def spare?
    @rolls.first(2).reduce(:+) == 10
  end

  def spare_score(all_frames)
    return @rolls.reduce(:+) if tenth_frame?
    next_frame = all_frames[@index + 1]
    next_throw = next_frame.first_throw
    10 + next_throw
  end

  def tenth_frame_finished?
    return @rolls.length == 3 if strike? || spare?
    @rolls.length == 2
  end
end

class BookKeeping
  VERSION = 1
end
