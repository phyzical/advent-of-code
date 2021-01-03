require_relative 'helpers.rb'
require_relative '16.1.rb'

module DaySixteenPartTwo
  module_function

  def solve(file)
    inputs = DaySixteenPartOne.prepare_inputs(file)
    invalid = find_invalid_inputs(inputs)
    invalid.sum
  end

  def find_invalid_inputs(inputs)
    results = []
    amount = inputs[:nearby][0].length
    i = 0
    while i < amount 
      inputs[:nearby].each do |nearby|
        nearby_input = nearby[i]
        res = inputs[:rules].any? do |rule| 
          ranges = rule[1]
          ranges.any? do |range| 
            (range[0]..range[1]).count(nearby_input) > 0
          end
        end
        results.push(nearby_input) if !res
      end
      results
    end
  end
end




ap DaySixteenPartTwo.solve(__dir__ + '/16.2test.txt')

# ap DaySixteenPartTwo.solve(__dir__ + '/16.txt')
