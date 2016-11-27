require 'parser'

describe Parser do
  describe 'Ignoring false place' do
    specify do
      expect { Parser.new('data/commands_false_place.txt') }.to \
        output("1,2,EAST\n").to_stdout
    end
  end

  describe 'Is not placed' do
    specify do
      expect { Parser.new('data/commands_no_place.txt') }.not_to \
        output.to_stdout
    end
  end

  describe 'Moves to north boundary' do
    specify do
      expect { Parser.new('data/move_6_north.txt') }.to \
        output("0,4,NORTH\n").to_stdout
    end
  end

  describe 'Turns right ' do
    specify do
      expect { Parser.new('data/turn_right.txt') }.to \
        output("0,0,EAST\n").to_stdout
    end
  end

  describe 'Turns left ' do
    specify do
      expect { Parser.new('data/turn_left.txt') }.to \
        output("0,0,WEST\n").to_stdout
    end
  end

  describe 'Attempt to parse image file ' do
    specify do
      expect { Parser.new('data/ruby.jpeg') }.to \
        output("Invalid file encoding, must be ascii compatable\n").to_stdout
    end
  end
end
