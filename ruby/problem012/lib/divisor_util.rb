class DivisorUtil

  def self.divisors_of(n)
    return [] if n <= 0
    divisors = []
    for i in 1..n do
      if n%i == 0
        divisors.push(i)
      end
    end
    divisors
  end

  def self.divisor_count_of(n)
    divisors_of(n).length
  end

end
