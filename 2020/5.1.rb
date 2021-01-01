require_relative 'helpers.rb'

module DayFivePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_highest_id(inputs)
  end

  def find_highest_id(inputs)
    inputs.reduce(0) do |result, input|
      row_index_end = 127
      row_index_start = 0
      column_index_start = 0
      column_index_end = 7
      input.split('').each do |char|
        if char == 'B'
          row_index_start = row_index_end - (row_index_end - row_index_start) / 2
        elsif char == 'F'
          row_index_end -= (row_index_end - row_index_start) / 2
        elsif char == 'R'
          column_index_start = column_index_end - (column_index_end - column_index_start) / 2
        else
          column_index_end -= (column_index_end - column_index_start) / 2
        end
      end
      id = row_index_start * 8 + column_index_start
      # puts "Row #{row_index_start} Column #{column_index_start} id #{id}"
      result = id if id > result
      result
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
  end
end

# puts DayFivePartOne.solve(__dir__ + '/5test.txt')
puts DayFivePartOne.solve(__dir__ + '/5.txt')
