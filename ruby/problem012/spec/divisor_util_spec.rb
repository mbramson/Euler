require 'divisor_util'

describe DivisorUtil do

  subject(:util) { DivisorUtil.new }

  describe '#divisors_of' do

    it 'returns [1] for 1' do
      expect(util.divisors_of 1 ).to eq [1]
    end

    it 'returns [1,2] for 2' do
      expect(util.divisors_of 2 ).to eq [1,2]
    end

    it 'returns [1,2,3] for 6' do
      expect(util.divisors_of 6 ).to eq [1,2,3]
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

end
