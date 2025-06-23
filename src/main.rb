require_relative 'get_degree'
require_relative 'update_map_x'
require_relative 'update_map'

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
    degree = get_degree(str)
    puts("Reduced form: #{data['a']}X² + #{data['b']}X + #{data['c']} = 0")
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
  sign = 1.0

  # types of input
  # N = [Int, Float]
  # PATTERN = [[+, -][N] [* X^2, * X, * X^1, * X^0], [+, -][X^1, X, X^2, X^0]]
  # FULL_PATTERN = [[PATTERN [+- PATTERN]...], 0] = [[PATTERN [+- PATTERN]...], 0]
  while i < arr.length
    if (arr[i].start_with?('-', '+') && ('0'..'9').to_a.include?(arr[i][1])) || ('0'..'9').to_a.include?(arr[i][0])
      data, i = update_map(data, arr, i, sign)
    elsif arr[i] == '='
      sign = -sign
      i += 1
    elsif ['+X^0', '-X^0', 'X^0', '+X^2', '-X^2', 'X^2', '+X^1', '-X^1', 'X^1', '+X', '-X', 'X'].include?(arr[i])
      data = update_map_single_x(data, arr[i], sign)
      i += 1
    else
      raise StandardError, "Unknown syntax: `#{arr[i]}`"
    end
  end

  data
end

main(ARGV.length, ARGV[0])
