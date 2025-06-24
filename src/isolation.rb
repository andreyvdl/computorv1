# Formula to solve 1st degree polynomial
#
# @param b [Float] b value
# @param c [Float] c value
# @return [void]
def isolation(b, c)
  print("#{b}X ")
  puts("+ #{c} - #{-c} = #{-c}") unless c.zero?
  puts('= 0') if c.zero?

  c = -c
  puts("X = #{c}/#{b}")
  cb = b.abs > c.abs ? Rational(c, b) : c / b
  puts("X = #{cb}")

  c = -c
  puts('')
  puts("#{b} * #{cb} + #{c} = 0")
  bcb = b * cb
  puts("#{bcb} + #{c} = 0")
  puts("#{bcb + c} = 0")
end
