require_relative 'helpers.rb'

module DayFivePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    calculate_ids(inputs).max
  end

  def calculate_ids(inputs)
    inputs.map do |input|
      row_index_end = 127
      row_index_start = 0
      column_index_start = 0
      column_index_end = 7
      input.chars.each do |char|
        case char
        when 'B'
          row_index_start =
            row_index_end - ((row_index_end - row_index_start) / 2)
        when 'F'
          row_index_end -= (row_index_end - row_index_start) / 2
        when 'R'
          column_index_start =
            column_index_end - ((column_index_end - column_index_start) / 2)
        else
          column_index_end -= (column_index_end - column_index_start) / 2
        end
      end
      (row_index_start * 8) + column_index_start
    end
  end

  def prepare_inputs(file)
    Helpers.split_inputs_by_line(Helpers.read_file(file))
  end
end

# puts DayFivePartOne.solve(__dir__ + '/5test.txt')
puts DayFivePartOne.solve("#{__dir__}/5.txt")
