class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    "#{@hour.to_s.rjust(2, '0')}:#{@minute.to_s.rjust(2, '0')}"
  end

  def +(other)
    @hour = (@hour + (other + @minute) / 60) % 24
    @minute = (other + @minute) % 60
    self
  end

  def self.at(hour, minute)
    hour = (hour + minute / 60) % 24
    minute = minute % 60
    new(hour, minute)
  end

  def ==(other)
    to_s == other.to_s
  end
end

class BookKeeping
  VERSION = 2
end
