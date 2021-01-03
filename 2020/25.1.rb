require_relative 'helpers.rb'

module DayTwentyFivePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyFivePartOne.solve(__dir__ + '/25test.txt')

#ap DayTwentyFivePartOne.solve(__dir__ + '/25.txt')
