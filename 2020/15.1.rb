require_relative 'helpers.rb'

module DayFifthteenPartOne
  module_function

  def solve(file,nth)
    inputs = prepare_inputs(file)
    find_final_number(inputs,nth)
  end

  def find_final_number(inputs, nth)
    numbers = {}
    i = inputs.length
    inputs.each_with_index do |value, index|
      numbers[value] = index + 1 if index != i-1
    end
    next_num = inputs[i-1]

    while i < nth
      ## if input found in numbers i - index of input
      last_num = next_num
      next_num = if numbers.key?(next_num)
                   i - numbers[next_num]
                 else
                   0
                 end
               

      numbers[last_num] = i
      i += 1

    end
    next_num
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split(',').map(&:to_i)
  end
end


iterations = 2020

ap DayFifthteenPartOne.solve(__dir__ + '/15test1.txt', iterations)  == 1
ap DayFifthteenPartOne.solve(__dir__ + '/15test2.txt', iterations) == 10
ap DayFifthteenPartOne.solve(__dir__ + '/15test3.txt', iterations) == 27
ap DayFifthteenPartOne.solve(__dir__ + '/15test4.txt', iterations) == 78
ap DayFifthteenPartOne.solve(__dir__ + '/15test5.txt', iterations) == 438
ap DayFifthteenPartOne.solve(__dir__ + '/15test6.txt', iterations) == 1836
ap DayFifthteenPartOne.solve(__dir__ + '/15test7.txt', iterations) == 436

ap DayFifthteenPartOne.solve(__dir__ + '/15.txt', iterations)
