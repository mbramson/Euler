class DivisorUtil

  def self.divisors_of(n)
    return [] if n <= 0
    return [1] if n == 1 # to avoid returning [1,1] for n == 1
    divisors = []
    for i in 1..(Math.sqrt(n).floor) do
      if n%i == 0
        divisors.push(i)
        divisors.push(n/i)
      end
    end
    divisors.sort
  end

  def self.divisor_count_of(n)
    divisors_of(n).length
  end

end
