require_relative 'helpers.rb'
require_relative '8.1.rb'

module DayEightPartTwo
  module_function

  def solve(file)
    inputs = DayEightPartOne.prepare_inputs(file)
    inputs.each_with_index do |v, k|
      next unless v[:command] != 'acc'

      new_inputs = inputs
      prev = new_inputs[k][:command]
      new_inputs[k][:command] = v[:command] == 'nop' ? 'acc' : 'nop'

      ## why is it passing by ref?
      new_inputs = new_inputs.map do |input|
        input[:visited] = false
        input
      end

      sum = get_boot_sum_fixed(new_inputs, 0, 0)
      new_inputs[k][:command] = prev
      return sum if sum.positive?
    end
  end

  def get_boot_sum_fixed(inputs, current_index, sum)
    current_input = inputs[current_index]

    ## she exited
    return sum if current_input.nil?

    command = current_input[:command]
    value = current_input[:value].to_f

    ## she looped
    return 0 if current_input[:visited]

    ## deeper we go
    inputs[current_index][:visited] = true
    if command == 'acc'
      current_index += 1
      sum += value
    elsif command == 'jmp'
      current_index += value
    else
      current_index += 1
    end
    get_boot_sum_fixed(inputs, current_index, sum)
  end
end

# puts DayEightPartTwo.solve(__dir__ + '/8test.txt')
puts DayEightPartTwo.solve(__dir__ + '/8.txt')
