require_relative '5.1.rb'

module DayFivePartTwo
  module_function

  def solve(file)
    inputs = DayFivePartOne.prepare_inputs(file)
    ids = DayFivePartOne.calculate_ids(inputs)
    find_missing_ids(ids)
  end

  def find_missing_ids(ids)
    ## for each id
    ## find an id +2 or -2
    ## then our id is +1 or -1 only if its not in list
    numbers = []
    ids.each do |num|
      if ids.count(num - 2).positive? && ids.count(num - 1).zero?
        numbers << (num - 1)
      end
      if ids.count(num + 2).positive? && ids.count(num + 1).zero?
        numbers << (num + 1)
      end
    end
    numbers.uniq
  end
end

# puts DayFivePartTwo.solve(__dir__ + '/5test.txt')
puts DayFivePartTwo.solve("#{__dir__}/5.txt")
