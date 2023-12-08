require_relative 'helpers.rb'

module DayElevenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    final_input = next_flip(inputs)
    count_occupied(final_input)
  end

  def count_occupied(inputs)
    total = 0
    inputs.each do |input|
      input.each do |v|
        total += 1 if v == '#'
      end
    end
    total
  end

  def next_flip(inputs)
    new_inputs = []
    any_change = false
    inputs.each_with_index do |values, y|
      values.each_with_index do |current, x|
        new_value = current

        top_row = inputs[y - 1]
        bottom_row = inputs[y + 1]
        middle_row = inputs[y]

        top = top_row[x] unless top_row.nil?
        top_right = top_row[x + 1] unless top_row.nil?
        right = middle_row[x + 1]
        bottom_right = bottom_row[x + 1] unless bottom_row.nil?
        bottom = bottom_row[x] unless bottom_row.nil?
        bottom_left = bottom_row[x - 1] unless bottom_row.nil?
        left = middle_row[x - 1]
        top_left = top_row[x - 1] unless top_row.nil?

        occupied_count = 0

        occupied_count += 1 if top == '#' && y > 0
        occupied_count += 1 if bottom == '#' && y < inputs.length
        occupied_count += 1 if left == '#' && x > 0
        occupied_count += 1 if right == '#' && x < values.length
        occupied_count += 1 if top_left == '#' && y > 0 && x > 0
        occupied_count += 1 if top_right == '#' && y > 0 && x < values.length
        occupied_count += 1 if bottom_left == '#' && y < inputs.length && x > 0
        occupied_count += 1 if bottom_right == '#' && y < inputs.length && x < values.length

        # ap "next #{y} #{x}"
        if current == 'L' && occupied_count == 0
          new_value = '#'
          any_change = true
        end

        if current == '#' && occupied_count >= 4
          new_value = 'L'
          any_change = true
        end

        new_inputs[y] = [] if new_inputs[y].nil?
        new_inputs[y][x] = new_value
      end
    end
    # ap new_inputs
    return next_flip(new_inputs) if any_change

    new_inputs
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
      .map do |v|
        v.split('')
      end
  end
end

# ap DayElevenPartOne.solve(__dir__ + '/11test.txt')
ap DayElevenPartOne.solve(__dir__ + '/11.txt')
