require_relative 'table'
require_relative 'facing'

# Robot class which holds the information about the robot
class Robot
  attr_accessor :x, :y, :f
  attr_accessor :table, :placed

  def initialize(x = 0, y = 0, f = 'NORTH')
    @placed = false
    @table = Table.new(5, 5)
    @x = x
    @y = y
    @f = Facing.new(f)
  end

  def do_command(command)
    return unless valid_command?(command)
    case command
    when 'REPORT'
      puts report
    when 'LEFT'
      @f.left
    when 'RIGHT'
      @f.right
    when 'MOVE'
      move
    when /^PLACE/
      place_text command
    end
  end

  def report
    "#{@x},#{@y},#{@f}"
  end

  def move
    x = @x
    y = @y
    case @f.to_s
    when 'NORTH'
      y = @y + 1
    when 'SOUTH'
      y = @y - 1
    when 'EAST'
      x = @x + 1
    when 'WEST'
      x = @x - 1
    end
    return unless valid_location?(x, y)
    @x = x
    @y = y
  end

  def valid_command?(command)
    return true if @placed && %w(MOVE RIGHT LEFT REPORT).include?(command)
    valid_place_command?(command) ? @placed = true : false
  end

  def valid_location?(x, y)
    @table.valid_location?(x, y)
  end

  def place_text(command)
    # relies on valid_place_command
    # it is kind of doubling up with place.
    x, y, f = command.scan(/^PLACE (\d+),(\d+),([A-Z]+)/)[0]
    place x.to_i, y.to_i, f
  end

  def place(x, y, f)
    return unless @table.valid_location?(x, y)
    @x = x
    @y = y
    @f.set(f)
  end

  private

  def valid_place_command?(command)
    !(command =~ /^PLACE [0-4],[0-4],(NORTH|EAST|SOUTH|WEST)$/).nil?
  end
end
