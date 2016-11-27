# The Table class is used just to hold the size of the table.

# Have a seperate table class is in anticipation that things will happen
# the the table. Like the size and obsticals as mentioned in the specification
# that we didn't need to do.

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
