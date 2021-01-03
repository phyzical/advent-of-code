require_relative 'helpers.rb'

module DayFifthteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_final_number(inputs)
  end

  def find_final_number(inputs)
    numbers = {}
    i = inputs.length
    last_num = 0
    inputs.each_with_index do |value, index|
      numbers[value.to_i] = index
    end

    ap numbers

    while i < 2020
      ## if input found in numbers i - index of input
      last_num = if numbers.key?(last_num)
                   i - last_num
                 else
                   0
                 end

      numbers[last_num] = i
      i += 1
      ap numbers

    end
    last_num
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split(',')
  end
end

# ap DayFifthteenPartOne.solve(__dir__ + '/15test1.txt')
ap DayFifthteenPartOne.solve(__dir__ + '/15test2.txt')
# ap DayFifthteenPartOne.solve(__dir__ + '/15.txt')
