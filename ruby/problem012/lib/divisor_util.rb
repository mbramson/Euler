class DivisorUtil

  def divisors_of(n)
    return [] if n <= 0
    divisors = []
    for i in 1..(n/2+1) do
      if n%i == 0
        divisors.push(i)
      end
    end
    divisors
  end

end
