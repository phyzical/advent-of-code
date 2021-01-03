require_relative 'helpers.rb'

module DaySixteenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    invalid = find_invalid_inputs(inputs)
    invalid.sum
  end

  def find_invalid_inputs(inputs)
    results = []
    inputs[:nearby].each do |nearby|
      nearby.each do |nearby_input| 
        res = inputs[:rules].any? do |rule| 
          ranges = rule[1]
          ranges.any? do |range| 
            (range[0]..range[1]).count(nearby_input) > 0
          end
        end
        results.push(nearby_input) if !res
      end
    end
    results
  end

  def prepare_inputs(file)
    text = Helpers.read_file(file).split("nearby tickets:\n") 

    nearby = text[1].split("\n").map do |ranges|
      ranges.split(",").map(&:to_i)
    end

    text = text[0].split("your ticket:\n")

    rules = text[0].split("\n").reduce({}) do |acc, rule|
      rule = rule.split(": ")
      key = rule[0]
      values = rule[1].split(" or ").map do |ranges|
        ranges.split("-").map(&:to_i)
      end
      acc[key] = values
      acc
    end
    your = text[1].tr("\n", "").split(",").map(&:to_i)
    {
      nearby: nearby,
      your: your,
      rules: rules
    }
  end
end




ap DaySixteenPartOne.solve(__dir__ + '/16test.txt')

ap DaySixteenPartOne.solve(__dir__ + '/16.txt')
