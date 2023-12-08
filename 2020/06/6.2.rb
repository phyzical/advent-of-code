require_relative 'helpers.rb'

module DaySixPartTwo
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    get_sum_agreed(inputs)
  end

  def get_sum_agreed(inputs)
    inputs.reduce(0) do |result, input|
      count_people = input.count("\n") + 1
      string = input.tr("\n", '')
      question_amount = string.chars.uniq.reduce(0) do |result2, letter|
        result2 += 1 if count_people == string.count(letter)
        result2
      end
      result + question_amount
    end
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split("\n\n")
  end
end

# puts DaySixPartTwo.solve(__dir__ + '/6test.txt')
puts DaySixPartTwo.solve(__dir__ + '/6.txt')
