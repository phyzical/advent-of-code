require_relative 'helpers.rb'

module DayFourPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    find_valid_passports(inputs)
  end

  def find_valid_passports(inputs)
    inputs.reduce(0) do |result, input|
      result += 1 if (%i[
        byr
        iyr
        eyr
        hgt
        hcl
        ecl
        pid
      ] - input.keys).empty?

      result
    end
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split("\n\n")
           .map do |inputs|
      inputs.split(/[\n ]/)
            .each_with_object({}) do |input, result|
        split_input = input.split(':')
        result[split_input[0].to_sym] = split_input[1]
      end
    end
  end
end

# puts DayFourPartOne.solve(__dir__ + '/4test.txt')
puts DayFourPartOne.solve(__dir__ + '/4.txt')
