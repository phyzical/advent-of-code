require_relative 'helpers.rb'
require_relative '14.1.rb'

module DayFourteenPartTwo
  module_function

  def solve(file)
    inputs = DayFourteenPartOne.prepare_inputs(file)
    masked_inputs = apply_mask(inputs)
    ap masked_inputs
    DayFourteenPartOne.find_sum(masked_inputs)
  end

  def apply_mask(inputs)
    results = {}
    inputs.each do |input_set|
      input_set[:inputs].each do |input|
        key = input[:binary_key].split('')
        keys_to_update = [key]
        input_set[:mask].each_with_index do |mask_in, index|
          keys_to_update = if mask_in == 'X'
                             ## do all variations
                             keys_to_update.each_with_object([]) do |key_input, acc|
                               input_zero = key_input.clone
                               input_one = key_input.clone
                               input_zero[index] = '0'
                               input_one[index] = '1'

                               acc.push(input_zero)
                               acc.push(input_one)
                             end
                           else
                             keys_to_update.map do |key_input|
                               key_input[index] = mask_in
                               key_input
                             end
                           end
        end
        ap inputs
        keys_to_update.uniq.each do |key_input|
          key_input = key_input.join.to_i(2)
          results[key_input] = input[:binary_value]
        end
      end
    end
    results
  end
end

ap DayFourteenPartTwo.solve(__dir__ + '/14.2test.txt')
# ap DayFourteenPartTwo.solve(__dir__ + '/14.txt')
