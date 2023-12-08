require_relative 'helpers.rb'

module DayTwentyTwoPartOne
  module_function

  def solve(file)
    decks = prepare_inputs(file)
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
    while (a_length > 0 && b_length > 0)
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
    end
    return decks[1] if a_length == 0
    return decks[0] if b_length == 0
  end

  def prepare_inputs(file)
    Helpers.read_file(file).split("\n\n").map do |deck|
      deck = deck.split("\n")
      deck.shift
      deck.map(&:to_i)
    end
  end
end




#ap DayTwentyTwoPartOne.solve(__dir__ + '/22test.txt')

ap DayTwentyTwoPartOne.solve(__dir__ + '/22.txt')
