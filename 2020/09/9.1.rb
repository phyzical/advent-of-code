require_relative 'helpers.rb'

module DayNinePartOne
  module_function

  def solve(file, preamble)
    inputs = prepare_inputs(file)
    find_incorrect_input(inputs, preamble)
  end

  def find_incorrect_input(inputs, preamble)
    old_inputs = inputs.clone.freeze
    index = preamble
    inputs.shift(preamble)
    inputs.each do |input|
      found = false
      (1..preamble).each do |preamble_index|
        (1..preamble).each do |preamble_index2|
          match = old_inputs[index - preamble_index].to_i
          match2 = old_inputs[index - preamble_index2].to_i
          next unless match2 != match && ((match + match2) == input.to_i)

          found = true
          break 2
        end
      end
      index += 1

      return input unless found
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
  end
end

# puts DayNinePartOne.solve(__dir__ + '/9test.txt', 5)
puts DayNinePartOne.solve(__dir__ + '/9.txt', 25)
