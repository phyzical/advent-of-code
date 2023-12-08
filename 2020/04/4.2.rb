require_relative '4.1.rb'

module DayFourPartTwo
  module_function

  def solve(file)
    inputs = DayFourPartOne.prepare_inputs(file)
    find_valid_passports(inputs)
  end

  def find_valid_passports(inputs)
    inputs.reduce(0) do |result, input|
      result += 1 if is_valid?(input)

      result
    end
  end

  def is_valid?(input)
    (%i[
      byr
      iyr
      eyr
      hgt
      hcl
      ecl
      pid
    ] - input.keys).empty? &&
      input[:byr].to_f >= 1920 && input[:byr].to_f <= 2002 &&
      input[:iyr].to_f >= 2010 && input[:iyr].to_f <= 2020 &&
      input[:eyr].to_f >= 2020 && input[:eyr].to_f <= 2030 &&
      is_valid_height?(input[:hgt]) &&
      is_valid_hair?(input[:hcl]) &&
      %w[amb blu brn gry grn hzl oth].include?(input[:ecl]) &&
      input[:pid].length == 9
  end

  def is_valid_hair?(hair_color)
    hair_color.length == 7 &&
      hair_color[0] == '#' &&
      hair_color.gsub(/[a-fA-F#\d]/, '').length == 0
  end

  def is_valid_height?(height)
    if height.count('cm') > 0
      height = height.delete!('cm').to_f
      height >= 150 && height <= 193
    else
      height = height.delete!('in').to_f
      height >= 59 && height <= 76
    end
  end
end

# puts DayFourPartTwo.solve(__dir__ + '/4test.txt')
puts DayFourPartTwo.solve(__dir__ + '/4.txt')
