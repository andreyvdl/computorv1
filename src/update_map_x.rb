# Abstracts map update
#
# @param data [Hash<String, Float>] the map
# @param str [String] The string
# @param sign [Float] the modifier if we are on the right side
# @return [Hash<String, Float>]
def update_map_single_x(data, str, sign)
  coefficient = sign * (str.start_with?('-') ? -1.0 : 1.0)

  case str
  when /X\^0$/, '+X^0', '-X^0'
    data['c'] += coefficient
  when /X\^2$/, '+X^2', '-X^2'
    data['a'] += coefficient
  when /X\^1$/, /X$/, '+X^1', '-X^1', '+X', '-X'
    data['b'] += coefficient
  end

  data
end
