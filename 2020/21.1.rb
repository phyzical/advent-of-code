require_relative 'helpers.rb'

module DayTwentyOnePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentyOnePartOne.solve(__dir__ + '/21test.txt')

#ap DayTwentyOnePartOne.solve(__dir__ + '/21.txt')
