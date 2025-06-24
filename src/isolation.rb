# Formula to solve 1st degree polynomial
#
# @param b_val [Float] b value
# @param c_val [Float] c value
# @return [void]
def isolation(b_val, c_val)
  print("#{b_val}X ")
  puts("+ #{c_val} - #{-c_val} = #{-c_val}") unless c_val.zero?
  puts('= 0') if c_val.zero?

  cb = firs_degree_find_x(b_val, -c_val)

  puts('')

  first_degree_print_real_proof(b_val, c_val, cb)
end

# Abstraction formula to solve 1st degree polynomial
#
# @param b_val [Float] b value
# @param c_val [Float] c value
# @return [Rational|Float]
def first_degree_find_x(b_val, c_val)
  puts("X = #{c_val}/#{b_val}")
  cb = b_val.abs > c_val.abs ? Rational(c_val, b_val) : c_val / b_val
  puts("X = #{cb}")

  cb
end

# Real proof to confirm the value found to X is right
#
# @param b_val [Float] b value
# @param c_val [Float] c value
# @param cb_val [Float|Rational] c/b value
# @return [void]
def first_degree_print_real_proof(b_val, c_val, cb_val)
  puts("#{b_val} * #{cb_val} + #{c_val} = 0")
  bcb = b_val * cb_val
  puts("#{bcb} + #{c_val} = 0")
  puts("#{bcb + c_val} = 0")
end
