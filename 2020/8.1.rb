require_relative 'helpers.rb'

module DayEightPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    get_boot_sum(inputs, 0, 0)
  end

  def get_boot_sum(inputs, current_index, sum)
    current_input = inputs[current_index]
    command = current_input[:command]
    value = current_input[:value].to_f
    if current_input[:visited]
      sum
    else
      inputs[current_index][:visited] = true
      if command == 'acc'
        current_index += 1
        sum += value
      elsif command == 'jmp'
        current_index += value
      else
        current_index += 1
      end
      get_boot_sum(inputs, current_index, sum)
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
      .map do |input|
        {
          command: input.split(' ')[0],
          value: input.split(' ')[1],
          visited: false
        }
      end
  end
end

# puts DayEightPartOne.solve(__dir__ + '/8test.txt')
puts DayEightPartOne.solve(__dir__ + '/8.txt')
