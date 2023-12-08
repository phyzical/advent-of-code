require_relative 'helpers.rb'

module DayOnePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_2020_sum(inputs)
  end

  def find_2020_sum(inputs)
    inputs.each do |a|
      inputs.each do |b|
        return a * b if a + b == 2020
      end
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
      .map(&:to_f)
  end
end

# puts DayOnePartOne.solve(__dir__ + '/1test.txt')
puts DayOnePartOne.solve(__dir__ + '/1.txt')
