require 'triangular_number_util'
require 'divisor_util'

class TriangularDivisorUtil

  def first_triangular_number_with_divisor_count(divisor_count)
    incrementor = 1
    while true do
      triangular_num = TriangularNumberUtil.get_number(incrementor)
      if DivisorUtil.divisor_count_of(triangular_num) >= divisor_count
        return triangular_num
      end
      incrementor += 1
    end
  end

end
