require 'parser'

RSpec.describe "Ignoring false place" do
  specify { expect { Parser.new('data/commands_false_place.txt') }.to output("Output: 1,2,EAST\n").to_stdout }
end

RSpec.describe "Is not placed" do
  specify { expect { Parser.new('data/commands_no_place.txt') }.not_to output.to_stdout }
end

RSpec.describe "Moves to north boundary" do
  specify { expect { Parser.new('data/move_6_north.txt') }.to output("Output: 0,4,NORTH\n").to_stdout }
end

RSpec.describe "Turns right " do
  specify { expect { Parser.new('data/turn_right.txt') }.to output("Output: 0,0,EAST\n").to_stdout }
end

RSpec.describe "Turns left " do
  specify { expect { Parser.new('data/turn_left.txt') }.to output("Output: 0,0,WEST\n").to_stdout }
end