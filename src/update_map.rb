# Abstracts map update
#
# @param data [Hash<String, Float>] the map
# @param arr [Array<String>] the equation
# @param idx [Integer] the index
# @param sign [Float] modifier if we are in the right side
# @return [Hash<String, Float>, Integer]
def update_map(data, arr, idx, sign)
  val = Float(arr[idx]) * sign

  idx += 1
  if idx >= arr.length
    data['c'] += val
    return [data, idx]
  elsif arr[idx] == '*'
    idx += 1
  elsif ['+', '-', '='].include?(arr[idx])
    data['c'] += val
    return [data, idx]
  else
    raise StandardError, "Invalid syntax: `#{arr[idx - 1]} #{arr[idx]}`"
  end

  case arr[idx]
  when 'X^0'
    data['c'] += val
  when 'X^2'
    data['a'] += val
  when 'X^1', 'X'
    data['b'] += val
  else
    raise StandardError, "Unknown syntax: `#{arr[idx]}`"
  end
  idx += 1

  [data, idx]
end
