require_relative 'helpers.rb'

module DaySevenPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    get_shiny_sum(inputs)
  end

  def get_shiny_sum(inputs)
    inputs.values.reduce(0) do |sum, bag_contents|
      found = false
      bag_contents.each do |key, _val|
        found = get_shiny_recursive(key, inputs, false) if found == false
      end
      sum += 1 if found
      sum
    end
  end

  def get_shiny_recursive(key, inputs, _res)
    inputs[key].keys.reduce(false) do |res, sub_key|
      if key == 'shinygold'
        res = true
      else
        res = true if get_shiny_recursive(sub_key, inputs, res)
      end
      res
    end
  end

  def prepare_inputs(file)
    Helpers
      .split_inputs_by_line(Helpers.read_file(file))
      .each_with_object({}) do |input, res|
        ## example inputs
        # light red bags contain 1 bright white bag, 2 muted yellow bags.
        # dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        # bright white bags contain 1 shiny gold bag.
        key = input.split(' bags')[0].tr(' ', '')
        contains = input.split('contain ')[1].tr('.', '')
        bag_contents = {}
        if contains.split('no other bags').length == 1
          bag_contents = contains.split(',')
                                 .each_with_object({}) do |contain, result2|
            sub_bag = contain.split(' bag')[0]
            count = sub_bag.split(' ')[0]
            result2[sub_bag.tr("#{count} ", '')] = count
          end
        end
        res[key] = bag_contents
      end
  end
end

# puts DaySevenPartOne.solve(__dir__ + '/7test.txt')
puts DaySevenPartOne.solve(__dir__ + '/7.txt')
