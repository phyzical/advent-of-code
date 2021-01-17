require_relative 'helpers.rb'

module DayTwentyPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split("\n\n").map do |tile| 
      tiles = tile.split("\n")
      id = tiles.shift.split(" ")[1].tr(":","").to_i
      {
        inputs: tiles,
        id: id
      }
    end
  end
end




ap DayTwentyPartOne.solve(__dir__ + '/20test.txt')

#ap DayTwentyPartOne.solve(__dir__ + '/20.txt')
