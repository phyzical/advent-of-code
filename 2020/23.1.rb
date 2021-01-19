require_relative 'helpers.rb'

module DayTwentyThreePartOne
  module_function

  def solve(string, moves)
    inputs = prepare_inputs(string)
    perform_moves(inputs, moves)
  end

  def perform_moves(inputs, moves)
    move = 0
    current_cup_index = 0
    current_cup = inputs[0]
    destination_label = current_cup - 1
    while moves > move
      ##  pluck 3 to the right clockwise
      destination_cup_index = nil
      while destination_cup_index.nil?
        destination_label -= 1
        destination_label = inputs.max if destination_label < inputs.min
        destination_cup_index = inputs.find(destination_label)
      end
      ## place pluck clockwise into inputs
    end
    inputs
  end

  def prepare_inputs(string)
    string.split('').map(&:to_i)
  end
end

ap DayTwentyThreePartOne.solve('389125467', 100)
# ap DayTwentyThreePartOne.solve('418976235',100)
