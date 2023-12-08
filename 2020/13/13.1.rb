require_relative 'helpers.rb'

module DayThirteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_number(inputs)
  end

  def find_number(inputs)
    arrival_time = inputs[:timestamp]
    buses = inputs[:inputs]
    min = nil
    nearest_bus = 0
    ap buses
    buses.each do |bus|
      nearest = (arrival_time / bus).ceil * bus
      min = nearest if min.nil? || nearest < min
      nearest_bus = bus if nearest <= min
    end
    (min - arrival_time) * nearest_bus
  end

  def prepare_inputs(file)
    inputs = Helpers
             .split_inputs_by_line(Helpers.read_file(file))
    {
      timestamp: inputs[0].to_i,
      inputs: inputs[1].gsub(/,x/, '').split(',').map(&:to_f)
    }
  end
end

# ap DayThirteenPartOne.solve(__dir__ + '/13test.txt')
ap DayThirteenPartOne.solve(__dir__ + '/13.txt')
