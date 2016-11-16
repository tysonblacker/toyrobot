require 'facing'

# Not really sure about the amount of testing that should be incuded in the test.

describe Facing do
  before :each do
    @facing = Facing.new
  end

  describe '.right' do
    context 'place on a board facing north and it asked to turn right' do
      it 'equals EAST' do
        expect(@facing.to_s).to eql('NORTH')
        @facing.right
        expect(@facing.to_s).to eql('EAST')
      end
    end
  end

  describe '.left' do
    context 'place on a board facing north and it asked to turn left' do
      it 'equals WEST' do
        expect(@facing.to_s).to eql('NORTH')
        @facing.left
        expect(@facing.to_s).to eql('WEST')
      end
    end
  end

  describe '.left' do
    context 'place on a board facing south and it asked to turn left' do
      it 'equals east' do
        @facing.set('SOUTH')
        @facing.left
        expect(@facing.to_s).to eql('EAST')
      end
    end
  end

  describe '.left' do
    context 'place on a board facing south and it asked to turn left' do
      it 'equals east' do
        @facing.set('SOUTH')
        @facing.right
        expect(@facing.to_s).to eql('WEST')
      end
    end
  end

  describe '.left' do
    context 'place on a board facing east and it asked to turn left' do
      it 'equals north' do
        @facing.set('EAST')
        @facing.left
        expect(@facing.to_s).to eql('NORTH')
      end
    end
  end

  describe '.right' do
    context 'place on a board facing east and it asked to turn right' do
      it 'equals north' do
        @facing.set('EAST')
        @facing.right
        expect(@facing.to_s).to eql('SOUTH')
      end
    end
  end

  describe '.left' do
    context 'place on a board facing west and it asked to turn left' do
      it 'equals west' do
        @facing.set('WEST')
        @facing.left
        expect(@facing.to_s).to eql('SOUTH')
      end
    end
  end

  describe '.right' do
    context 'place on a board facing east and it asked to turn right' do
      it 'equals north' do
        @facing.set('WEST')
        @facing.right
        expect(@facing.to_s).to eql('NORTH')
      end
    end
  end
end
