require_relative 'helpers.rb'

module DayTwentySixPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file))
  end
end




ap DayTwentySixPartOne.solve(__dir__ + '/26test.txt')

#ap DayTwentySixPartOne.solve(__dir__ + '/26.txt')
