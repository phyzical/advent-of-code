require_relative 'helpers.rb'

module DayNineteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    calculate_valid_messages(inputs,0,res)
  end

  def calculate_valid_messages(inputs,index,res)
    current = inputs[index]

    return current if current == "a" || current == "b"
    return () + () if current == "|"

    current.each do |current_input|
      current_input = current_input.to_i
    end

    char = char.to_i if char != "a" && char != "b" && char != "|"
  end

  def prepare_inputs(file)
    input_split = Helpers.read_file(file).split("\n\n")
    messages = input_split[0].split("\n").reduce({}) do |acc,input| 
      input = input.split(": ")
      acc[input[0].to_i] = input[1].tr('"',"").split(' ')
      acc
    end
    {
      messages: messages,
      rules: input_split[1].split("\n"),
    }
  end
end




ap DayNineteenPartOne.solve(__dir__ + '/19test.txt')

#ap DayNineteenPartOne.solve(__dir__ + '/19.txt')
