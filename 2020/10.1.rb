require_relative 'helpers.rb'

module DayTenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    res = find_jumps(inputs, { one: 0, three: 0, voltage: 0 })
    res[:one] * res[:three]
  end

  def find_jumps(inputs, res)
    last_min = inputs.min
    if last_min.nil?
      res[:three] += 1
      res[:voltage] += 3
      return res
    end

    difference = last_min - res[:voltage]
    res[:voltage] = last_min
    if difference == 3
      res[:three] += 1
    elsif difference == 1
      res[:one] += 1
    end
    inputs.delete_at(inputs.index(last_min))
    find_jumps(inputs, res)
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file)).map(&:to_i)
  end
end

# ap DayTenPartOne.solve(__dir__ + '/10test.txt')
# ap DayTenPartOne.solve(__dir__ + '/10test2.txt')
ap DayTenPartOne.solve(__dir__ + '/10.txt')
