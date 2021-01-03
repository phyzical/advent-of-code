require_relative 'helpers.rb'

module DayTwentyFourPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyFourPartOne.solve(__dir__ + '/24test.txt')

#ap DayTwentyFourPartOne.solve(__dir__ + '/24.txt')
