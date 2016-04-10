require 'triangular_divisor_util'

describe TriangularDivisorUtil do

  subject(:util) { TriangularDivisorUtil.new }

  describe '#first_triangular_number_with_divisor_count' do

    it 'returns 1 for 1' do
      expect(util.first_triangular_number_with_divisor_count 1).to be 1
    end

    it 'returns 3 for 2' do
      expect(util.first_triangular_number_with_divisor_count 2).to be 3
    end

    it 'returns 6 for 3' do
      expect(util.first_triangular_number_with_divisor_count 3). to be 6
    end

    it 'returns 6 for 4' do
      expect(util.first_triangular_number_with_divisor_count 4).to be 6
    end

    it 'returns 1 for 0' do
      expect(util.first_triangular_number_with_divisor_count 0).to be 1
    end

  end

end
