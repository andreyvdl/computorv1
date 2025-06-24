# delta formula implementation
#
# @param a_val [Float] the a value
# @param b_val [Float] the b value
# @param c_val [Float] the c value
# @return [Float]
def calculate_delta(a_val, b_val, c_val)
  b2 = b_val**2
  four = 4 * a_val * c_val
  puts("delta = #{b_val}^2 - 4 * #{a_val} * #{c_val}")
  puts("delta = #{b2} - #{four}")
  puts("delta = #{b2 - four}")
  puts('')
  b2 - four
end

# positive delta calculus
#
# @param a_val [Float] the a value
# @param b_val [Float] the b value
# @param delta [Float] the delta value
# @return [void]
def second_degree_two_x(a_val, b_val, delta)
  puts("X1 = (-(#{b_val}) + square_root(#{delta})) / (2 * #{a_val})")
  delta_sqrt = Math.sqrt(delta)
  two = a_val * 2.0
  b_minus = -b_val
  puts("X1 = (#{b_minus} + #{delta_sqrt}) / #{two}")
  x1 = b_minus + delta_sqrt
  puts("X1 = #{x1} / #{two}")
  x1 = (x1 / two).remainder(1.0).nonzero? ? Rational(x1, two) : x1 / two
  puts("X1 = #{x1}")

  puts('')

  puts("X2 = (-(#{b_val}) - square_root(#{delta})) / (2 * #{a_val})")
  puts("X2 = (#{b_minus} - #{delta_sqrt}) / #{two}")
  x2 = b_minus - delta_sqrt
  puts("X2 = #{x2} / #{two}")
  x2 = (x2 / two).remainder(1.0).nonzero? ? Rational(x2, two) : x2 / two
  puts("X2 = #{x2}")
end

# zero delta calculus
#
# @param a_val [Float] the a value
# @param b_val [Float] the b value
# @return [void]
def second_degree_x(a_val, b_val)
  puts("X = -(#{b_val}) / (2 * #{a_val})")
  two = a_val * 2.0
  b_val = -b_val
  puts("X = #{b_val} / #{two}")
  x = (b_val / two).remainder(1.0).nonzero? ? Rational(b_val, two) : b_val / two
  puts("X = #{x}")
end

# negative delta calculus
#
# @param a_val [Float] the a value
# @param b_val [Float] the b value
# @param delta [Float] the delta value
# @return [void]
def second_degree_complex_x(a_val, b_val, delta)
  puts("X1 = (-(#{b_val}) + square_root(#{delta})) / (2 * #{a_val})")
  delta_sqrt = Math.sqrt(delta.abs) * 1i
  two = a_val * 2.0
  b_minus = -b_val
  puts("X1 = (#{b_minus} + #{delta_sqrt}) / #{two}")
  x1 = b_minus + delta_sqrt
  puts("X1 = #{x1} / #{two}")
  x1 /= two
  puts("X1 = #{x1}")

  puts('')

  puts("X2 = (-(#{b_val}) - square_root(#{delta})) / (2 * #{a_val})")
  puts("X2 = (#{b_minus} - #{delta_sqrt}) / #{two}")
  x2 = b_minus - delta_sqrt
  puts("X2 = #{x2} / #{two}")
  x2 /= two
  puts("X2 = #{x2}")
end
