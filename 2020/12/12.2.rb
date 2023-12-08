require_relative 'helpers'
require_relative './12.1'

module DayTwelvePartTwo
  module_function

  def solve(file, waypoint)
    ap 'Start'
    inputs = DayTwelvePartOne.prepare_inputs(file)
    process_moves(inputs, waypoint)
  end

  def process_moves(inputs, waypoint)
    boat = [0, 0]
    inputs.each do |input|
      move = input.split('')[0]
      ap input

      input.slice!(0)
      amt = input.to_f
      if move == 'F'
        boat[0] += amt * waypoint[0]
        boat[1] += amt * waypoint[1]
      elsif move == 'N'
        waypoint[1] += amt
      elsif move == 'S'
        waypoint[1] -= amt
      elsif move == 'E'
        waypoint[0] += amt
      elsif move == 'W'
        waypoint[0] -= amt
        ## need to get the waypoints direct given the boat location
      elsif move == 'L'
        xx = waypoint[0]
        yy = waypoint[1]
        case amt
        when 90
          waypoint = [-yy, xx]
        when 180
          waypoint = [-xx, -yy]
        when 270
          waypoint = [yy, -xx]
        end
      elsif move == 'R'
        xx = waypoint[0]
        yy = waypoint[1]
        case amt
        when 90
          waypoint = [yy, -xx]
        when 180
          waypoint = [-xx, -yy]
        when 270
          waypoint = [-yy, xx]
        end
      end
      # ap 'waypoint'
      # ap waypoint
      # ap 'boat'
      # ap boat
    end
    boat[0].abs + boat[1].abs
  end
end

# ap DayTwelvePartTwo.solve(__dir__ + '/12test.txt', [10, 1])
ap DayTwelvePartTwo.solve(__dir__ + '/12.txt', [10, 1])
