require_relative 'helpers.rb'

module DaySixPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    get_sum_unique(inputs)
  end

  def get_sum_unique(inputs)
    inputs.reduce(0) do |result, input|
      result + input.chars.uniq.count
    end
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split("\n\n").map { |input| input.tr("\n", '') }
  end
end

# puts DaySixPartOne.solve(__dir__ + '/6test.txt')
puts DaySixPartOne.solve(__dir__ + '/6.txt')
