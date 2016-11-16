require_relative 'robot'
require_relative 'table'
require_relative 'facing'

# The Parser class holds the information about the file holding the instructions
# for the robot.
class Parser
  def initialize(filename)
    @rob_the_robot = Robot.new

    begin
      File.open(filename, 'r').each_line do |line|
        begin
          @rob_the_robot.do_command(line.strip)
        rescue Encoding::CompatibilityError
          # this might come from the regex parsing
          puts 'Invalid line encoding, must be ascii compatable'
        end
      end
    rescue ArgumentError
      puts 'Invalid file encoding, must be ascii compatable'
    end
  end
end
