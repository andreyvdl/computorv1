require_relative 'bhaskara_formulas'

# Bhaskara formula implementation
#
# @param a_val [Float] the a value
# @param b_val [Float] the b value
# @param c_val [Float] the c value
# @return [void]
def bhaskara(a_val, b_val, c_val)
  delta = calculate_delta(a_val, b_val, c_val)

  if delta.positive?
    puts('Delta is positive')
    second_degree_two_x(a_val, b_val, delta)
  elsif delta.zero?
    puts('Delta is zero')
    second_degree_x(a_val, b_val)
  else
    puts('Delta is negative')
    second_degree_complex_x(a_val, b_val, delta)
  end
end
