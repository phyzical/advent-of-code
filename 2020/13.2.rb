require_relative 'helpers.rb'

module DayThirteenPartTwo
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    check_next_time(inputs)
  end

  def check_next_time(inputs)
    buses = inputs.clone
    found = true
    i = 1000
    while found
      time = i * buses[0]
      buses.each_with_index do |bus, index|
        next if index.zero? || bus.zero?

        next_time = time + index
        nearest = (next_time / bus).ceil * bus
        if next_time != nearest
          found = false
          break
        end
      end
      i += 1
    end
    time
  end

  def prepare_inputs(file)
    inputs = Helpers
             .split_inputs_by_line(Helpers.read_file(file))
    inputs[1].split(',').map do |input|
      input = 0 if input == 'x'
      input.to_f
    end
  end
end
ap DayThirteenPartTwo.solve(__dir__ + '/13.2.1test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13.2.2test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13.2.3test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13.2.4test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13.2.5test.txt')
# ap DayThirteenPartTwo.solve(__dir__ + '/13.txt')
