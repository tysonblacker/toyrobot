# The Facing class holds the information regarding the direction in which the
# robot is facing and how to change it's directions.
class Facing
  def initialize(direction = 'NORTH')
    
    @dirs = { 'NORTH' => 0, 'EAST' => 1, 'SOUTH' => 2, 'WEST' => 3 }
    set(direction)
  end

  def right
    @facing = (@facing += 1) % 4
  end

  def left
    @facing = (@facing -= 1) % 4
  end

  def to_s
    @dirs.key(@facing)
  end

  def set(f)
    return unless valid_facing?(f)
    @facing = @dirs[f]
  end

  def valid_facing?(f)
    @dirs.keys.include?(f)
  end
end