require_relative 'helpers.rb'

module DayTwentyOnePartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file)).map do |line|
      split = line.split(" (contains ")
      ingredients = split[0].split(" ")
      allergens = split[1].tr(")","").split(", ")
      {
        ingredients: ingredients,
        allergens: allergens
      }
    end
  end
end




ap DayTwentyOnePartOne.solve(__dir__ + '/21test.txt')

#ap DayTwentyOnePartOne.solve(__dir__ + '/21.txt')
