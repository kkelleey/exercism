class RailFenceCipher
  VERSION = 1

  def self.encode(string, rail_count)
    return string if string.empty? || rail_count < 2
    @rail_count = rail_count

    rails = Array.new(rail_count) { [] }
    sequence.cycle.with_index do |rail_index, string_index|
      break(rails) if string[string_index].nil?
      rails[rail_index] << string[string_index]
    end.flatten.join
  end

  def self.decode(string, rail_count)
    return string if string.empty? || rail_count < 2
    @string = string
    @rail_count = rail_count

    chars = []
    rails = full_rails
    sequence.cycle do |rail_index|
      break(chars) if rails[rail_index].empty?
      chars << rails[rail_index].shift
    end.join
  end

  def self.letters_per_rail
    hash = Hash.new { 0 }
    sequence.cycle.with_index do |rail_index, index|
      break(hash) if index >= @string.length
      hash[rail_index] += 1
    end
  end

  def self.full_rails
    string = @string.chars
    letters_per_rail.each_with_object([]) do |(rail_index, size), rails|
      rails[rail_index] = string.slice!(0...size)
    end
  end

  def self.sequence
    rail_indices = (0..@rail_count - 1).to_a
    rail_indices + rail_indices.reverse[1...-1]
  end
end
