# The Table class is used just to hold the size of the table.
class Table
  attr_reader :x, :y
  # before validate size of table.
  def initialize(x, y)
    # normalise table
    @x = x - 1
    @y = y - 1
  end

  def valid_location?(new_x, new_y)
    (0..@y).cover?(new_y) && (0..@x).cover?(new_x)
  end
end