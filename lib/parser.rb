require_relative 'robot'
require_relative 'table'
require_relative 'facing'

# The Parser class holds the information about the file holding the instructions
# for the robot.
class Parser
  def initialize(filename)
    @rob_the_robot = Robot.new

    File.open(filename, 'r').each_line do |line|
      @rob_the_robot.do_command(line.strip.upcase)
    end
  end
end
