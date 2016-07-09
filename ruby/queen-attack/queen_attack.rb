class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    (0..7).each_with_object([]) do |row_index, rows|
      rows << row_array(row_index).join(' ')
    end.join("\n")
  end

  def attack?
    same_row || same_column || diagonal
  end

  private

  def diagonal
    (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end

  def same_row
    @white[0] == @black[0]
  end

  def same_column
    @white[1] == @black[1]
  end

  def row_array(index)
    (0..7).each_with_object([]) do |column, row_array|
      row_array << cell_value([index, column])
    end
  end

  def cell_value(coordinates)
    return 'W' if coordinates == @white
    return 'B' if coordinates == @black
    '_'
  end
end
