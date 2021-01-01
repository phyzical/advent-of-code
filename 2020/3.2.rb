require_relative '3.1.rb'

module DayThreePartTwo
  module_function

  def solve(file)
    inputs = DayThreePartOne.prepare_inputs(file)
    patterns = [
      { right: 1, down: 1 },
      { right: 3, down: 1 },
      { right: 5, down: 1 },
      { right: 7, down: 1 },
      { right: 1, down: 2 }
    ]
    patterns.reduce(1) do |total, pattern|
      total *= find_total_trees(inputs, 0, 0, 0, pattern)
      total
    end
  end

  def find_total_trees(inputs, total, x, y, pattern)
    row_length = inputs[0].length
    column_length = inputs.length
    x += pattern[:right]
    x -= row_length if x >= row_length
    y += pattern[:down]
    # y -= column_length if y >= column_length
    if y < column_length
      total += 1 if inputs[y][x] == '#'
      total = find_total_trees(inputs, total, x, y, pattern)
    end
    total
  end
end

# puts DayThreePartTwo.solve(__dir__ + '/3test.txt')
puts DayThreePartTwo.solve(__dir__ + '/3.txt')
