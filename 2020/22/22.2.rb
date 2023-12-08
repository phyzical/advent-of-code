require_relative 'helpers.rb'
require_relative '22.1.rb'

module DayTwentyTwoPartTwo
  module_function

  def solve(file)
    decks = DayTwentyTwoPartOne.prepare_inputs(file)
    winning_deck = find_winner(decks)
    get_score(winning_deck)
  end

  def get_score(winning_deck)
    winning_deck.reverse.each_with_index.reduce(0) do |acc, (v, i)|
      acc + (v * (i + 1))
    end
  end

  def find_winner(decks) 
    a_length = decks[0].length
    b_length = decks[1].length
    history = [].push(decks.clone)
    while (a_length > 0 && b_length > 0)
      infinite_loop_check = history.find do |history_decks|
        history_decks[0] == decks[0]
        history_decks[1] == decks[1]
      end

      return if infinite_loop_check

      a_card = decks[0].shift
      b_card = decks[1].shift

      if a_card > b_card
        decks[0].push(a_card)
        decks[0].push(b_card)
      else
        decks[1].push(b_card)
        decks[1].push(a_card)
      end

      a_length = decks[0].length
      b_length = decks[1].length
      history.push(decks.clone)
    end
    return decks[1] if a_length == 0
    return decks[0] if b_length == 0
  end
end




ap DayTwentyTwoPartTwo.solve(__dir__ + '/22test.txt')

#ap DayTwentyTwoPartTwo.solve(__dir__ + '/22.txt')
