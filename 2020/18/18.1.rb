require_relative 'helpers.rb'

module DayEighteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    inputs_calculated = calculate_line_sums(inputs)
    inputs_calculated.sum
  end

  def calculate_line_sums(inputs)
    inputs.map do |input|
      last_char = nil 
      input.reduce(0) do |acc, char|
        ## first time
        acc = char.to_i if last_char.nil?
        ## multiple
        acc *= char.to_i if last_char == '*'
        ## plus
        acc += char.to_i if last_char == '+'
        
        ##acc += recurse? if last_char == '('
        ##return recurse? if last_char == ')'

        last_char = char
      end
    end
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file)).map({|input| input.split(" ")})
  end
end




ap DayEighteenPartOne.solve(__dir__ + '/18test.txt') == (13632 + 12240 + 437 + 26)

#ap DayEighteenPartOne.solve(__dir__ + '/18.txt')
