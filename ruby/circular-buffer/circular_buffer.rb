class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
  STARTING_LOCATION = 0

  def initialize(size)
    @values = Array.new(size)
    @read_location = @write_location = STARTING_LOCATION
  end

  def read
    raise BufferEmptyException if @values[@read_location].nil?
    value = @values[@read_location]
    @values[@read_location] = nil
    @read_location = increment(@read_location)
    value
  end

  def write(str)
    raise BufferFullException unless @values[@write_location].nil?
    _write(str)
  end

  def write!(str)
    unless @values[@write_location].nil?
      @read_location = increment(@read_location)
    end
    _write(str)
  end

  def clear
    @values.map! { nil }
  end

  private

  def increment(value)
    (value + 1) % @values.size
  end

  def _write(str)
    @values[@write_location] = str
    @write_location = increment(@write_location)
  end
end
