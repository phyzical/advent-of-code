require_relative '2.1.rb'

module DayTwoPartTwo
  module_function

  def solve(file)
    inputs = DayTwoPartOne.prepare_inputs(file)
    find_valid_passwords(inputs)
  end

  def find_valid_passwords(inputs)
    inputs.reduce(0) do |total, value|
      first,
      second,
      letter,
      password = value.values_at(:min, :max, :letter, :password)
      char1 = password[first - 1]
      char2 = password[second - 1]
      is_valid = char1 != char2 && (char1 == letter || char2 == letter)
      total += 1 if is_valid
      total
    end
  end
end

# puts DayTwoPartTwo.solve(__dir__ + '/2test.txt')
puts DayTwoPartTwo.solve(__dir__ + '/2.txt')
