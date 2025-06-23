# Function to determinate the degree of the equation
#
# @param str [String] the equation
# @return [Integer]
def get_degree(str)
  degree = 0

  loop do
    i = str.index('^')

    break unless i

    v = Integer(str[i + 1])

    degree = v unless v < degree
    str = str[i + 1..]
  end

  degree
end
