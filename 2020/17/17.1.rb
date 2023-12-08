require_relative "helpers"

module DaySeventeenPartOne
  module_function

  def solve(file)
    grid = { "0": prepare_inputs(file) }

    6.times { grid = do_cycle(grid) }
    byebug
    grid.reduce(0) do |acc, slice|
      acc +
        slice.reduce(0) do |acc2, val|
          acc2 += 1 if val == "#"
          acc2
        end
    end
  end

  def do_cycle(grid)
    new_front_slice_index = (grid.first.first.to_s.to_i - 1).to_s.to_sym
    new_back_slice_index = (grid.to_a.last.first.to_s.to_i + 1).to_s.to_sym

    y_len =  grid[grid.first.first].count
    x_len =  grid[grid.first.first].first.count
    grid[new_front_slice_index] = Array.new(y_len, Array.new(x_len, "."))
    grid[new_back_slice_index] = Array.new(y_len, Array.new(x_len, "."))
    grid = grid.sort_by { |k, _v| k.to_s.to_i }.to_h

    ## make new grid with same keys to be filled with extra heights
    new_grid = grid.keys.product([Array.new(y_len + 2, [])]).to_h
    grid.each do |current_index, slice|
      forward_slice = grid[(current_index.to_s.to_i - 1).to_s.to_sym]
      behind_slice = grid[(current_index.to_s.to_i + 1).to_s.to_sym]

      slice.each_with_index do |y_slice, y|
        y_slice.prepend(".").append(".")
        y_slice.each_with_index do |value, x|
          new_value = value
          actives = 0
          actives += count_slice_actives(forward_slice, x, y) if forward_slice
          actives += count_slice_actives(slice, x, y, false)
          actives += count_slice_actives(behind_slice, x, y) if behind_slice
          if value == "#" && ![2, 3].include?(actives)
            new_value = "."
          elsif value == "." && actives == 3
            new_value = "#"
          end

          new_grid[current_index][y][x] = new_value
        end
      end
    end
    new_grid
  end

  def count_slice_actives(slice, x, y, disable_middle = true)
    matches = []
    y_max = slice.count - 1

    matches << slice[y - 1][x + 1] if (y - 1) >= 0
    matches << slice[y][x + 1]
    matches << slice[y + 1][x + 1] if  (y + 1) <= y_max
    matches << slice[y - 1][x] if (y - 1) >= 0
    matches << slice[y][x] if disable_middle
    matches << slice[y + 1][x] if (y + 1) <= y_max
    matches << slice[y - 1][x - 1] if (y - 1) >= 0
    matches << slice[y][x - 1]
    matches << slice[y + 1][x - 1] if (y + 1) <= y_max
    matches.reduce(0) do |acc, val|
      acc += 1 if val == "#"
      acc
    end
  end

  def prepare_inputs(file)
    Helpers.split_inputs_by_line(Helpers.read_file(file)).map(&:chars)
  end
end

ap DaySeventeenPartOne.solve("#{__dir__}/17test.txt")

# ap DaySeventeenPartOne.solve(__dir__ + '/17.txt')
