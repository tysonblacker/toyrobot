require_relative 'robot'
require_relative 'table'
require_relative 'facing'

# The Parser class holds the information about the file holding the instructions
# for the robot.
class Parser

  def valid_command?(command)
    return true if @placed && ["MOVE", "RIGHT", "LEFT", "REPORT"].include?(command)
    return @placed = true if valid_place?(command)
    false
  end

  def initialize(filename)
    
    @rob_the_robot = Robot.new
    @placed = false

    File.open(filename, 'r') do |infile|
      while (line = infile.gets)
        if valid_command?(line.strip.upcase)
          puts line
          @rob_the_robot.command(line.strip.upcase)
        end
      end
    end
  end

  private

    def valid_place?(command)
      !(command =~ /^PLACE [0-4],[0-4],(NORTH|EAST|SOUTH|WEST)$/).nil?
    end

end
