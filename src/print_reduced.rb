# Prints the reduced form of the equation
#
# @param data [Hash<String, Float>] The equation values
# @return [void]
def print_reduced(data)
  a = data['a']
  b = data['b']
  c = data['c']

  print('Reduced form: ')

  terms = []
  terms << "#{a}X^2" unless a == 0.0
  terms << "#{b}X" unless b == 0.0
  terms << c.to_s unless c == 0.0

  if terms.empty?
    puts('0 = 0')
  else
    puts("#{terms.join(' + ')} = 0")
  end
end
