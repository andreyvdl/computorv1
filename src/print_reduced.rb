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
  terms << "#{a}X^2" unless a.zero?
  terms << "#{b}X" unless b.zero?
  terms << c.to_s unless c.zero?

  if terms.empty?
    puts('0 = 0')
  else
    puts("#{terms.join(' + ')} = 0")
  end
end
