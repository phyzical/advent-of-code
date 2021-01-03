require_relative 'helpers.rb'

module DayTwentyTwoPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyTwoPartOne.solve(__dir__ + '/22test.txt')

#ap DayTwentyTwoPartOne.solve(__dir__ + '/22.txt')
