# The Facing class holds the information regarding the direction in which the
# robot is facing and how to change it's directions.
class Facing
  DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze
  MOVE_RIGHT = 1
  MOVE_LEFT = -1

  def initialize(direction = 'NORTH')
    @facing = direction
  end

  def right
    change_facing MOVE_RIGHT
  end

  def left
    change_facing MOVE_LEFT
  end

  def to_s
    @facing
  end

  def set(f)
    return unless valid_facing?(f) # don't really need this as it is in the
    # command validation regex
    @facing = f
  end

  private

  def valid_facing?(f)
    DIRECTIONS.include?(f)
  end

  def change_facing(change)
    @facing = DIRECTIONS[((DIRECTIONS.index(@facing) + change) % 4)]
  end
end
