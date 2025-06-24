require_relative 'isolation'

# Print steps taken to reach the results
#
# @param data [Hash<String, Float>] the equation values
# @return [void]
def print_steps_n_result(data)
  if !data['a'].zero?
    puts('Solving with bhaskara')
    bhaskara(data['a'], data['b'], data['c'])
  elsif !data['b'].zero?
    puts('Solving with isolation')
    isolation(data['b'], data['c'])
  else
    puts('Solving with comparasion')
    puts("X can be any number (implicit infinite solutions)? #{data['c'].zero?}")
  end
end
