require_relative 'helpers.rb'

module DayTwentyPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyPartOne.solve(__dir__ + '/20test.txt')

#ap DayTwentyPartOne.solve(__dir__ + '/20.txt')
