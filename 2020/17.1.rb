require_relative 'helpers.rb'

module DaySeventeenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)

    (0..5).each { inputs }
  end

  def prepare_inputs(file)
    Helpers.split_inputs_by_line(Helpers.read_file(file))
  end
end

ap DaySeventeenPartOne.solve("#{__dir__}/17test.txt")

#ap DaySeventeenPartOne.solve(__dir__ + '/17.txt')
