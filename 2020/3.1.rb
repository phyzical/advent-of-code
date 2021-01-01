require_relative 'helpers.rb'

module DayThreePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_total_trees(inputs, 0, 0, 0)
  end

  def find_total_trees(inputs, total, x, y)
    row_length = inputs[0].length
    column_length = inputs.length
    x += 3
    x -= row_length if x >= row_length
    y += 1
    # y -= column_length if y >= column_length
    if y < column_length
      total += 1 if inputs[y][x] == '#'
      total = find_total_trees(inputs, total, x, y)
    end
    total
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
  end
end

# puts DayThreePartOne.solve(__dir__ + '/3test.txt')
puts DayThreePartOne.solve(__dir__ + '/3.txt')
