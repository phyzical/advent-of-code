require_relative 'helpers'
require_relative './11.1'

module DayElevenPartTwo
  module_function

  def solve(file)
    inputs = ::DayElevenPartOne.prepare_inputs(file)
    final_input = next_flip(inputs)
    ::DayElevenPartOne.count_occupied(final_input)
  end

  def next_flip(inputs)
    new_inputs = []
    any_change = false
    y_length = inputs.count
    x_length = inputs[0].count

    inputs.each_with_index do |values, y|
      values.each_with_index do |current, x|
        new_value = current

        up_row = (0..(y - 1)).to_a.reverse
        down_row = ((y + 1)..(y_length - 1)).to_a
        left_row = (0..(x - 1)).to_a.reverse
        right_row = ((x + 1)..(x_length - 1)).to_a
        matches = []

        ## up
        if y.positive?
          up_row.each do |o|
            val = inputs[o][x]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## up right

        if y.positive? && x < x_length && !right_row.empty?
          up_row.each_with_index do |o, index|
            break if !right_row[index]

            val = inputs[o][right_row[index]]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## up left

        if y.positive? && x.positive? && !left_row.empty?
          up_row.each_with_index do |o, index|
            break if !left_row[index]

            val = inputs[o][left_row[index]]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## right

        if x < x_length
          right_row.each do |o|
            val = inputs[y][o]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## down

        if y < y_length
          down_row.each do |o|
            val = inputs[o][x]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## left

        if x.positive?
          left_row.each do |o|
            val = inputs[y][o]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## down left

        if y < y_length && x.positive? && !left_row.empty?
          down_row.each_with_index do |o, index|
            break if !left_row[index]

            val = inputs[o][left_row[index]]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        ## down right

        if y < y_length && x < x_length && !right_row.empty?
          down_row.each_with_index do |o, index|
            break if !right_row[index]

            val = inputs[o][right_row[index]]
            if %w[# L].include?(val)
              matches << val
              break
            end
          end
        end

        occupied_count =
          matches.reduce(0) do |acc, o|
            acc += 1 if o == '#'
            acc
          end

        if current == 'L' && occupied_count.zero?
          new_value = '#'
          any_change = true
        elsif current == '#' && occupied_count >= 5
          new_value = 'L'
          any_change = true
        end

        new_inputs[y] = [] if new_inputs[y].nil?
        new_inputs[y][x] = new_value
      end
    end

    ap 'flip'

    Helpers.print_grid(new_inputs)
    return next_flip(new_inputs) if any_change

    new_inputs
  end
end

# ap DayElevenPartTwo.solve(__dir__ + '/11test.txt')
ap DayElevenPartTwo.solve(__dir__ + '/11.txt')
