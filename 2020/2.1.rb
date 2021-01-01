require_relative 'helpers.rb'

module DayTwoPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_valid_passwords(inputs)
  end

  def find_valid_passwords(inputs)
    inputs.reduce(0) do |total, value|
      min,
      max,
      letter,
      password = value.values_at(:min, :max, :letter, :password)
      letter_count = password.count(letter)
      total += 1 if letter_count >= min && letter_count <= max
      total
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
      .map do |input|
        ## 2-9 c: ccccccccc
        inputs = input.split
        {
          min: inputs[0].split('-')[0].to_f,
          max: inputs[0].split('-')[1].to_f,
          letter: inputs[1].delete_suffix(':'),
          password: inputs[2]
        }
      end
  end
end

# puts DayTwoPartOne.solve(__dir__ + '/2test.txt')
puts DayTwoPartOne.solve(__dir__ + '/2.txt')
