class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    board.map { |row| row.join(' ') }.join("\n")
  end

  def attack?
    same_row || same_column || diagonal
  end

  private

  def board
    Array.new(8) do |row_index|
      Array.new(8) do |column_index|
        cell_value(row_index, column_index)
      end
    end
  end

  def cell_value(row, column)
    return 'W' if [row, column] == @white
    return 'B' if [row, column] == @black
    '_'
  end

  def diagonal
    (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end

  def same_row
    @white[0] == @black[0]
  end

  def same_column
    @white[1] == @black[1]
  end
end
