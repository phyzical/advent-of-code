require_relative 'helpers.rb'

module DayTwelvePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    process_moves(inputs)
  end

  def process_moves(inputs)
    directions = {
      north: 0,
      east: 90,
      south: 180,
      west: 270
    }
    direction = 90
    current_direction = nil
    x = 0
    y = 0
    inputs.each do |input|
      move = input.split('')[0]
      input.slice!(0)
      amt = input.to_f
      ap direction
      if move == 'F'
        directions.each do |direction_find, direction_amt|
          current_direction = direction_find if direction_amt == direction
        end
        if current_direction == :north
          y += amt
        elsif current_direction == :south
          y -= amt
        elsif current_direction == :east
          x += amt
        elsif current_direction == :west
          x -= amt
        end
      elsif move == 'N'
        y += amt
      elsif move == 'S'
        y -= amt
      elsif move == 'E'
        x += amt
      elsif move == 'W'
        x -= amt
      elsif move == 'L'
        direction -= amt
      elsif move == 'R'
        direction += amt
      end
      if direction < 0
        direction += 360
      elsif direction >= 360
        direction -= 360
      end
    end
    x + y
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
  end
end

# ap DayTwelvePartOne.solve(__dir__ + '/12test.txt')
ap DayTwelvePartOne.solve(__dir__ + '/12.txt')
