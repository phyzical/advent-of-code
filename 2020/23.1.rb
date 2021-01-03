require_relative 'helpers.rb'

module DayTwentyThreePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyThreePartOne.solve(__dir__ + '/23test.txt')

#ap DayTwentyThreePartOne.solve(__dir__ + '/23.txt')
