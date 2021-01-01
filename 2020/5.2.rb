require_relative '5.1.rb'

module DayFivePartTwo
  module_function

  def solve(file)
    inputs = DayFivePartOne.prepare_inputs(file)
    ids = get_ids(inputs)
    find_missing_id(ids)
  end

  def find_missing_id(ids)
    (0..1016).find do |num|
      puts num
      !ids.count(num - 1).zero? &&
        !ids.count(num + 1).zero?
    end
  end

  def get_ids(inputs)
    inputs.map do |input|
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
      row_index_start * 8 + column_index_start
    end
  end
end

# puts DayFivePartTwo.solve(__dir__ + '/5test.txt')
puts DayFivePartTwo.solve(__dir__ + '/5.txt')
