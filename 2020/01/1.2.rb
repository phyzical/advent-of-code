require_relative '1.1.rb'

module DayOnePartTwo
  module_function

  def solve(file)
    inputs = DayOnePartOne.prepare_inputs(file)
    find_2020_sum(inputs)
  end

  def find_2020_sum(inputs)
    inputs.each do |a|
      inputs.each do |b|
        inputs.each do |c|
          return a * b * c if a + b + c == 2020
        end
      end
    end
  end
end

# puts DayOnePartTwo.solve(__dir__ + '/1test.txt')
puts DayOnePartTwo.solve(__dir__ + '/1.txt')
