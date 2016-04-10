require 'triangular_number_util'

describe TriangularNumberUtil do

  subject(:util) { TriangularNumberUtil }

  describe '.get_number' do
    it 'returns the first triangular number' do
      expect(util.get_number(1)).to be 1
    end

    it 'returns the second triangular number' do
      expect(util.get_number(2)).to be 3
    end

    it 'returns the third triangular number' do
      expect(util.get_number(3)).to be 6
    end

    it 'returns 0 if given an index of 0' do
      expect(util.get_number(0)).to be 0
    end

    it 'returns 0 if given a negative index' do
      expect(util.get_number(-5)). to be 0
    end
  end

end
