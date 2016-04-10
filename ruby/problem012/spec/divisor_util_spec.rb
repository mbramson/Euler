require 'divisor_util'

describe DivisorUtil do

  subject(:util) { DivisorUtil }

  describe '.divisors_of' do

    it 'returns [1] for 1' do
      expect(util.divisors_of 1 ).to eq [1]
    end

    it 'returns [1,2] for 2' do
      expect(util.divisors_of 2 ).to eq [1,2]
    end

    it 'returns [1,2,3] for 6' do
      expect(util.divisors_of 6 ).to eq [1,2,3,6]
    end

    it 'returns [] for 0' do
      expect(util.divisors_of 0 ).to eq []
    end

    it 'returns [] for negative input' do
      expect(util.divisors_of -20 ).to eq []
    end

    it 'returns [] for decimal values' do
      expect(util.divisors_of 98.5 ).to eq []
    end

  end

  describe '#divisor_count_of' do

    it 'returns 1 for 1' do
      expect(util.divisor_count_of 1 ).to be 1
    end

    it 'returns 2 for 2' do
      expect(util.divisor_count_of 2 ).to be 2
    end

    it 'returns 3 for 6' do
      expect(util.divisor_count_of 6 ).to be 4
    end

    it 'returns 0 for 0' do
      expect(util.divisor_count_of 0 ).to be 0
    end

    it 'returns 0 for negative input' do
      expect(util.divisor_count_of -10 ).to be 0
    end

    it 'returns 0 for decimal values' do
      expect(util.divisor_count_of 33.3 ).to be 0
    end

  end

end
