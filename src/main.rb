# Main function for script language
#
# @param argc [Numeric] the number of arguments
# @param argv [String] the argument list
# @return [void]
def main(argc, argv)
  if argc != 1
    puts("Too #{argc > 1 ? 'many' : 'few'} arguments")
    return
  end

  argv = argv.strip

  valid_chars = ['+', '-', '*', '=', 'X', '^', ' '] + ('0'..'9').to_a
  invalid_chars = argv.each_char.find { |c| !valid_chars.include?(c) }

  if invalid_chars
    puts("Unkown character: #{invalid_chars}")
    return
  end

  str = argv.gsub(' - ', ' -').gsub(' + ', ' +')

  begin
    data = mount_map(str.split(' '))
    degree = find_degree(str)
    puts(data)
    puts("Degree: #{degree}")
  rescue ArgumentError, TypeError => e
    puts("Convertion to real number error: #{e.message}")
  rescue StandardError => e
    puts("Error while executing: #{e.message}")
  end
end

# Build map from polymonial equation
#
# @param arr [Array<String>] the equation
# @return [Hash<String, Float>]
def mount_map(arr)
  data = { 'a' => 0.0, 'b' => 0.0, 'c' => 0.0 }
  i = 0
  val = 0.0
  sign = 1.0

  # types of input
  # N = [Int, Float]
  # PATTERN = [[+, -][N] [* X^2, * X, * X^1, * X^0], [+, -][X^1, X, X^2, X^0]]
  # FULL_PATTERN = [[PATTERN [+- PATTERN]...], 0] = [[PATTERN [+- PATTERN]...], 0]
  while i < arr.length
    if (['-', '+'].include?(arr[i][0]) && ([] + ('0'..'9').to_a).include?(arr[i][1])) || ([] + ('0'..'9').to_a).include?(arr[i][0])
      val = Float(arr[i]) * sign
      i += 1
      if arr[i] == '*'
        i += 1
      elsif ['+', '-', '='].include?(arr[i])
        data['c'] += val
        next
      else
        raise StandardError, "Invalid syntax: `#{arr[i - 1]} #{arr[i]}`"
      end

      case arr[i]
      when 'X^0'
        data['c'] += val
      when 'X^2'
        data['a'] += val
      when 'X^1', 'X'
        data['b'] += val
      else
        raise StandardError, "Unknown syntax: `#{arr[i]}`"
      end
      i += 1
    elsif arr[i] == '='
      sign = -sign
      i += 1
    elsif '+X^0' == arr[i] || '-X^0' == arr[i] || 'X^0' == arr[i]
      if arr[i][0] == '-'
        data['c'] += -1.0 * sign
      else
        data['c'] += 1.0 * sign
      end
      i += 1
    elsif '+X^2' == arr[i] || '-X^2' == arr[i] || 'X^2' == arr[i]
      if arr[i][0] == '-'
        data['a'] += -1.0 * sign
      else
        data['a'] += 1.0 * sign
      end
      i += 1
    elsif '+X^1' == arr[i] || '-X^1' == arr[i] ||'X^1' == arr[i] || '+X' == arr[i] || '-X' == arr[i] || 'X' == arr[i]
      if arr[i][0] == '-'
        data['b'] += -1.0 * sign
      else
        data['b'] += 1.0 * sign
      end
      i += 1
    else
      raise StandardError, "Unknown syntax: `#{arr[i]}`"
    end
  end

  data
end

# Function to determinate the degree of the equation
#
# @param str [String] the equation
# @return [Integer]
def find_degree(str)
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

main(ARGV.length, ARGV[0])
