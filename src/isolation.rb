# Formula to solve 1st degree polynomial
#
# @param b_val [Float] b value
# @param c_val [Float] c value
# @return [void]
def isolation(b_val, c_val)
  print("#{b_val}X ")
  puts("+ #{c_val} - #{-c_val} = #{-c_val}") unless c_val.zero?
  puts('= 0') if c_val.zero?
  first_degree_find_x(b_val, -c_val)
end

# Abstraction formula to solve 1st degree polynomial
#
# @param b_val [Float] b value
# @param c_val [Float] c value
# @return [void]
def first_degree_find_x(b_val, c_val)
  puts("X = #{c_val} / #{b_val}")

  cb = (c_val / b_val).remainder(1.0).nonzero? ? Rational(c_val, b_val) : c_val / b_val
  puts("X = #{cb}")
end
