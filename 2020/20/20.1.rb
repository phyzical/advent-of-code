require_relative "helpers"

module DayTwentyPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    inputs = findMatches(inputs)
    input = findArrangement(inputs)
    calculateHashSum(input)
  end

  def findMatches(inputs)
    result = []
    inputs.map.with_index do |input, index|
      tile = input[:tile]
      tile[:top] = {
        inputs: tile[:top],
        matches:
          inputs
            .map
            .with_index do |input2, index2|
              next nil if index2 == index

              matches = {}
              matches[:top] = input2[:top] if [input, input_reversed].include?(input2[:top])
              matches[:bottom] = input2[:bottom] if [input, input_reversed].include?(input2[:bottom])
              matches[:left] = input2[:left] if [input, input_reversed].include?(input2[:left])
              matches[:right] = input2[:right] if [input, input_reversed].include?(input2[:right])
              matches
            end
            .compact,
      }
      input[:bottom]
      input[:left]
      input[:right]
    end
    result
  end

  def findArrangement(inputs)
    result = [][]
    result
  end

  def calculateHashSum(input)
    input.first.first * input.first.last * input.last.first * input.last.last
  end

  def prepare_inputs(file)
    Helpers
      .read_file(file)
      .split("\n\n")
      .map do |tile|
        rows = tile.split("\n")
        id = rows.shift.split[1].tr(":", "").to_i

        {
          tile: {
            top: rows.first,
            bottom: rows.last,
            left: rows.map { |x| x[0..0] }.join,
            right: rows.map { |x| x[(x.length - 1)..(x.length - 1)] }.join,
          },
          id: id,
        }
      end
  end
end

ap DayTwentyPartOne.solve(__dir__ + "/20test.txt")

# ap DayTwentyPartOne.solve(__dir__ + '/20.txt')
