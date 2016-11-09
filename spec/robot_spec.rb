require 'robot'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe '.new' do
    context 'placed with default values'
    it 'is at 0,0 and facing NORTH' do
      expect(@robot.report).to eql('Output: 0,0,NORTH')
    end
  end

  describe '.move' do
    context 'the robot is to move one step north'
    it 'is at 0, 1 and facing NORTH' do
      expect(@robot.report).to eql('Output: 0,0,NORTH')
      @robot.move
      expect(@robot.report).to eql('Output: 0,1,NORTH')
    end
  end

  describe '.place' do
    context 'the robot is placed in a valid location'
    it 'is at 3,2 and facing south' do
      expect(@robot.report).to eql('Output: 0,0,NORTH')
      @robot.place(3, 2, 'SOUTH')
      expect(@robot.report).to eql('Output: 3,2,SOUTH')
    end
  end

  describe 'invalid place' do
    context 'the robot is placed invlid spot'
    it 'is at 5,0' do
      expect(@robot.report).to eql('Output: 0,0,NORTH')
      @robot.place(5, 0, 'SOUTH')
      expect(@robot.report).to eql('Output: 0,0,NORTH')
    end
  end

  describe 'invalid space north' do
    context 'try to move from a valid space to invalid space'
    it 'should not move' do
      @robot.place(0, 4, 'NORTH')
      @robot.move
      expect(@robot.report).to eql('Output: 0,4,NORTH')
    end
  end

  describe 'invalid space south' do
    context 'try to move from a valid space to invalid space'
    it 'should not move' do
      @robot.place(0, 0, 'SOUTH')
      @robot.move
      expect(@robot.report).to eql('Output: 0,0,SOUTH')
    end
  end  

  describe 'invalid space west' do
    context 'try to move from a valid space to invalid space'
    it 'should not move' do
      @robot.place(0, 0, 'WEST')
      @robot.move
      expect(@robot.report).to eql('Output: 0,0,WEST')
    end
  end

  describe 'invalid space east' do
    context 'try to move from a valid space to invalid space'
    it 'should not move' do
      @robot.place(4, 0, 'EAST')
      @robot.move
      expect(@robot.report).to eql('Output: 4,0,EAST')
    end
  end

end