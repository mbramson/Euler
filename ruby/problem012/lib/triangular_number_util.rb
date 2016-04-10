class TriangularNumberUtil

  def get_number(index)
    sum = 0
    for i in 1..index
      sum += i
    end
    sum
  end

end
