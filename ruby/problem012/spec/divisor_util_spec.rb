require 'divisor_util'

describe DivisorUtil do

  subject(:util) { DivisorUtil.new }

  describe '#get_divisors' do

    it 'returns [1] for 1' do
      expect(util.get_divisors(1)).to eq [1]
    end

    it 'returns [1,2] for 2' do
      expect(util.get_divisors(2)).to eq [1,2]
    end

    it 'returns [1,2,3] for 6' do
      expect(util.get_divisors(6)).to eq [1,2,3]
    end

    it 'returns [] for 0' do
      expect(util.get_divisors(0)).to eq []
    end

    it 'returns [] for negative input' do
      expect(util.get_divisors(-20)).to eq []
    end

    it 'returns [] for decimal values' do
      expect(util.get_divisors(98.5)).to eq []
    end

  end

end
