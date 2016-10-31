class Robot

  attr_accessor :x, :y, :f
  attr_accessor :table
  
  def initialize x = 0, y = 0, f = 'NORTH'
    table = Table.new(5, 5)
    @x = x
    @y = y
    @f = Facing.new(f)
  end

  def move(command)
    case command
    when "LEFT"
      @f.left
    when "RIGHT"
      @f.right
    when "MOVE"
      move
    end
    
  end

  def report
    puts "#{@x},#{@y},#{@f.to_str}"
  end 

  def valid_location
    (0..@table.y).include?(@y) and (0..@table.x).include?(@x) 
  end


  def place(x, y, f)
    if valid_location?(x,y, @table) 
      puts error
    else
      @x = x
      @y = y
      @facing = f
    end
  end

end

class Facing

  @directions = ['NORTH', 'EAST', 'SOUTH', "WEST"]
  @dirs = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3 }
  #current_direction = 0

  attr_accessor :facing

  def initialize(direction = 'NORTH')
    @directions = ['NORTH', 'EAST', 'SOUTH', "WEST"]
    @dirs = {"NORTH" => 0, "EAST" => 1, "SOUTH" => 2, "WEST" => 3 }
    puts @dirs
    @facing = @dirs[direction]    
  end

  def right 
    @facing = (@facing += 1) % 4 
  end
 
  def left 
    @facing = (@facing -= 1) % 4
  end

  def to_str
    @directions[@facing]
  end

end

class Table

  def initialize x, y
    @x = x
    @y = y
  end
end


r = Robot.new
puts r.report
r.move("LEFT")
puts r.report
r.move("LEFT")
puts r.report


d = Facing.new('NORTH')
puts d.to_str
d.right
puts d.to_str
d.left
d.left
puts d.to_str





