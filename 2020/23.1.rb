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
    while moves > move
      current_cup = inputs[current_cup_index]
      destination_label = current_cup

      ##  pluck 3 to the right clockwise
      pluck_start = current_cup_index + 1
      pluck_end = current_cup_index + 4
      slice = []
      if pluck_end >= inputs.length
        pluck_from_start = pluck_end - inputs.length 
        pluck_from_end = 3 - pluck_from_start
        slice = inputs.slice(pluck_from_end , inputs.length -1)
                .merge(inputs.slice(0 , pluck_from_start))
      else
        slice = inputs.slice(pluck_start , pluck_end)
      end

      destination_cup_index = nil
      while destination_cup_index.nil?
        destination_label -= 1
        destination_label = inputs.max if destination_label < inputs.min
        destination_cup_index = inputs.find(destination_label)
      end

      destination_start = destination_cup_index + 1
      destination_end = destination_cup_index + 4

      if destination_end >= inputs.length
        destination_from_start = destination_end - inputs.length 
        destination_from_end = 3 - destination_from_start
      else
        # slice = inputs.slice(pluck_start , pluck_end)
      end
      ## place pluck clockwise into inputs
      current_cup_index = 
      move += 1
    end
    inputs
  end

  def prepare_inputs(string)
    string.split('').map(&:to_i)
  end
end

ap DayTwentyThreePartOne.solve('389125467', 100)
# ap DayTwentyThreePartOne.solve('418976235',100)
