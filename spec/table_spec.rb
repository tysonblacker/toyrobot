require 'table'



describe Table do
  before :each do
    @table = Table.new(5, 5)
  end

  describe 'location' do
    context 'valid location'
    it '0,0 is valid' do
      expect(@table.valid_location?(0, 0)).to eql(true)
    end
  end

  describe 'location' do
    context 'invalid location'
    it '5,0 is and invalid' do
      expect(@table.valid_location?(5, 0)).to eql(false)
    end
  end

  describe 'location' do
    context 'invalid location'
    it '0,5 is invalid' do
      expect(@table.valid_location?(0, 5)).to eql(false)
    end
  end

  describe 'location' do
    context 'valid location'
    it '4,4 is valid' do
      expect(@table.valid_location?(4, 4)).to eql(true)
    end
  end
end
