require 'pry'

class Game
  def initialize
    @current_frame = 1
    @frames = Array.new(10) { |index| Frame.new(index + 1) }
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' unless pins.between?(0, 10)
    raise 'Should not be able to roll after game is over' if game_over?
    add_roll(pins)
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless game_over?
    @frames.each.reduce(0) do |a, e|
      a + e.score(@frames)
    end
  end

  private

  def game_over?
    @frames.last.finished?
  end

  def add_roll(pins)
    frame = @frames[@current_frame - 1]
    frame.add_roll(pins)
    @current_frame += 1 if frame.finished?
  end
end

class Frame
  attr_reader :rolls

  def initialize(number)
    @number = number
    @rolls = []
  end

  def add_roll(pins)
    check_pin_count(pins)
    @rolls << pins
  end

  def finished?
    return false if @rolls.empty?
    if @number == 10
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

  private

  def check_pin_count(pins)
    if first_throw && !strike? && pins + first_throw > 10
      raise 'Pin count exceeds pins on the lane'
    end
  end

  def tenth_frame?
    @number == 10
  end

  def strike_score(all_frames)
    return @rolls.reduce(:+) if tenth_frame?
    10 + next_two_throws(all_frames)
  end

  def next_two_throws(all_frames)
    next_frame = all_frames[@number]
    first_throw = next_frame.rolls.first
    second_throw = if next_frame.strike?
                     all_frames[@number + 1].rolls.first
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
    next_frame = all_frames[@number]
    next_throw = next_frame.rolls.first
    10 + next_throw
  end

  def tenth_frame_finished?
    if strike? || spare?
      @rolls.length == 3
    else
      @rolls.length == 2
    end
  end
end
