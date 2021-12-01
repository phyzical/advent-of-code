require_relative 'helpers.rb'

module DaySeventeenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    grid = [inputs, inputs, inputs]

    6.times { grid = do_cycle(grid) }
    grid.reduce(0) do |acc, slice|
      acc +
        slice.reduce(0) do |acc2, val|
          acc2 += 1 if val == '#'
          acc2
        end
    end
  end

  def do_cycle(grid)
    new_grid = [[], [], []]
    grid.each_with_index do |slice, index|
      forward_slice = grid[index + 1] if index + 1 <= 2
      behind_slice = grid[index - 1] if index - 1 >= 0

      slice.each_with_index do |y_slice, y|
        y_slice.each_with_index do |value, x|
          new_value = value
          actives = 0
          actives += count_slice_actives(forward_slice, x, y) if forward_slice
          actives += count_slice_actives(slice, x, y, false)
          actives += count_slice_actives(behind_slice, x, y) if behind_slice
          if value == '#' && !(actives == 2 || actives == 3)
            new_value = '.'
          elsif value == '.' && actives == 3
            new_value = '#'
          end
          ap " y #{y}  x #{x}  #{actives} #{value} #{new_value}"

          new_grid[index][y] = [] if new_grid[index][y].nil?
          new_grid[index][y][x] = new_value
        end
      end
    end
    new_grid
  end

  def count_slice_actives(slice, x, y, disable_middle = true)
    matches = []
    x_max = slice[0].count - 1
    y_max = slice.count - 1

    matches << slice[y - 1][x + 1] if (x + 1) <= x_max && (y - 1) >= 0
    matches << slice[y][x + 1] if (x + 1) <= x_max
    matches << slice[y + 1][x + 1] if (x + 1) <= x_max && (y + 1) <= y_max
    matches << slice[y - 1][x] if (y - 1) >= 0
    matches << slice[y][x] if disable_middle
    matches << slice[y + 1][x] if (y + 1) <= y_max
    matches << slice[y - 1][x - 1] if (y - 1) >= 0 && (x - 1) >= 0
    matches << slice[y][x - 1] if (x - 1) >= 0
    matches << slice[y + 1][x - 1] if (x - 1) >= 0 && (y + 1) <= y_max
    matches.reduce(0) do |acc, x|
      acc += 1 if x == '#'
      acc
    end
  end

  def prepare_inputs(file)
    Helpers.split_inputs_by_line(Helpers.read_file(file)).map(&:chars)
  end
end

ap DaySeventeenPartOne.solve("#{__dir__}/17test.txt")

#ap DaySeventeenPartOne.solve(__dir__ + '/17.txt')
