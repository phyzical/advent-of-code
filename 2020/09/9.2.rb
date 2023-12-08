require_relative 'helpers.rb'
require_relative '9.1.rb'

module DayNinePartTwo
  module_function

  def solve(file, preamble)
    inputs = DayNinePartOne.prepare_inputs(file)
    inputs_original = inputs.clone
    incorrect_input = DayNinePartOne.find_incorrect_input(inputs, preamble)
    incorrect_index = inputs_original.find_index(incorrect_input)
    inputs_original.pop(inputs_original.length - incorrect_index - 1)
    chain_values = find_chain_values(inputs_original)
    find_weakness(chain_values)
  end

  def find_weakness(chain_values)
    chain_values.min +
      chain_values.max
  end

  def find_chain_values(inputs)
    match = inputs.pop.to_i
    index = 1
    inputs.each do |inputa|
      total = inputa.to_i
      inputs2 = inputs.clone
      inputs2.shift(index)
      res = [inputa.to_i]
      inputs2.each do |inputb|
        if inputa != inputb
          res.push(inputb.to_i)
          total += inputb.to_i
        end
        return res if total == match
      end
      index += 1
    end
    nil
  end
end

# ap DayNinePartTwo.solve(__dir__ + '/9test.txt', 5)
ap DayNinePartTwo.solve(__dir__ + '/9.txt', 25)
