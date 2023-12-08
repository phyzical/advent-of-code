require_relative 'helpers.rb'

module DayTwentyFourPartOne
  module_function

  def solve(file)
    inputs = prepare_inputs(file)
    
  end

  def prepare_inputs(file)
    Helpers
    .split_inputs_by_line(Helpers.read_file(file)).map do |line|
      moves = {
        se: 0,
        sw: 0,
        nw: 0,
        ne: 0,
        e: 0,
        w: 0
      }
      while line.length > 0
        single = line[0]
        double = single + line[1] if !line[1].nil?

        if double == "se"
          moves[:se] += 1
          line[0] = ""
          line[0] = ""
        elsif double == "sw"
          moves[:sw] += 1
          line[0] = ""
          line[0] = ""
        elsif double == "nw"
          moves[:nw] += 1
          line[0] = ""
          line[0] = ""
        elsif double == "ne"
          moves[:ne] += 1
          line[0] = ""
          line[0] = ""
        elsif single == "e"
          moves[:e] += 1
          line[0] = ""
        elsif single == "w"
          moves[:w] += 1
          line[0] = ""
        end
      end
      moves
    end
  end
end




ap DayTwentyFourPartOne.solve(__dir__ + '/24test.txt')

#ap DayTwentyFourPartOne.solve(__dir__ + '/24.txt')
