require_relative 'helpers.rb'
require_relative '7.1.rb'

module DaySevenPartTwo
  module_function

  def solve(file)
    inputs = DaySevenPartOne.prepare_inputs(file)
    get_shiny_sum_recursive(inputs, 'shinygold') - 1
  end

  def get_shiny_sum_recursive(inputs, key)
    bag_contents = inputs[key]
    bag_contents.keys.reduce(1) do |total, sub_key|
      total += bag_contents[sub_key].to_f * get_shiny_sum_recursive(inputs, sub_key) if bag_contents[sub_key]
      total
    end
  end
end

# puts DaySevenPartTwo.solve(__dir__ + '/7.2test.txt')
puts DaySevenPartTwo.solve(__dir__ + '/7.txt')
