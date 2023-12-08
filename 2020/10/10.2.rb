require_relative 'helpers.rb'
require_relative './10.1.rb'

module DayTenPartTwo
  module_function

  def solve(file)
    inputs = DayTenPartOne.prepare_inputs(file)
    jumps = DayTenPartOne.find_jumps(inputs, { one: 0, three: 0, voltage: 0 })
  end
end

ap DayTenPartTwo.solve("#{__dir__}/10test.txt")
# ap DayTenPartTwo.solve("#{__dir__}/10test2.txt")
# ap DayTenPartTwo.solve("#{__dir__}/10.txt")
