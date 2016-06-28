class Fixnum
  def format!
    to_s.rjust(2, '0')
  end
end

class Clock
  def initialize(hour, minute)
    @minutes = hour * 60 + minute
  end

  def to_s
    "#{hour.format!}:#{minute.format!}"
  end

  def +(other)
    @minutes += other
    self
  end

  def self.at(hour, minute)
    new(hour, minute)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def hour
    (@minutes / 60) % 24
  end

  def minute
    @minutes % 60
  end
end

class BookKeeping
  VERSION = 2
end
