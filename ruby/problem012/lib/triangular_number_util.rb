class TriangularNumberUtil

  def get_number(index)
    if index < 0
      0
    else
      index * (index + 1) / 2
    end
  end

end
