require_relative 'helpers.rb'

module DayFourteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    masked_inputs = apply_mask(inputs)
    ap masked_inputs
    find_sum(masked_inputs)
  end

  def find_sum(inputs)
    inputs.reduce(0) do |acc, input|
      acc + input.to_i(2)
    end
  end

  def apply_mask(inputs)
    results = {}
    inputs.each do |input_set|
      input_set[:inputs].each do |input|
        key = input[:key]
        value = input[:value].split('')
        input_set[:mask].each_with_index do |mask_in, index|
          value[index] = mask_in
        end
        results[key] = value.join
      end
    end
    results
  end

  def prepare_inputs(file)
    inputs = Helpers.read_file(file).split('mask = ')
    inputs.delete_at(0)
    inputs.map do |input|
      mem_inputs = Helpers
                   .split_inputs_by_line(input)
      mask = mem_inputs[0]
      mem_inputs.delete_at(0)
      i = 0
      {
        mask: mask.split('').each_with_object({}) do |mask_in, acc|
          acc[i] = mask_in if mask_in != 'X'
          i += 1
        end,
        inputs: mem_inputs.map do |mem_input|
          trim_inputs = mem_input.tr('mem[] ', '').split('=')
          {
            key: trim_inputs[0].to_i,
            value: '%036b' % trim_inputs[1].to_i.to_s(2)
          }
        end
      }
    end
  end
end

ap DayFourteenPartOne.solve(__dir__ + '/14test.txt')
# ap DayFourteenPartOne.solve(__dir__ + '/14.txt')
