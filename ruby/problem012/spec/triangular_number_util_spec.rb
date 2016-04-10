require 'triangular_number_util'

describe TriangularNumberUtil do

  subject(:util) { TriangularNumberUtil.new }

  describe '#get_number' do
    it 'should return the first triangular number' do
      expect(util.get_number(1)).to be(1)
    end

    it 'should return the second triangular number' do
      expect(util.get_number(2)).to be(3)
    end

    it 'should return the third triangular number' do
      expect(util.get_number(3)).to be(6)
    end

  end

end
