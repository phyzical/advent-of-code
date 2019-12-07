defmodule DaySevenPartOne do
  @moduledoc false

  def solve(input) do
    input |>
      Helper.splitStringByNewLine |>
      parseInput |>
      mergeSequence |>
      IO.inspect
  end

  def mergeSequence(sequences = [first|rest]) when sequences |> Kernel.length > 0 do
    result  = first |> mergeSequence(rest)
    result2 = sequences |> Enum.filter(fn item -> item != result end)



    [result] ++ (result2 |> mergeSequence)
  end

  def mergeSequence(_) do
    []
  end

  def mergeSequence(sequence = %{after: key1}, sequences = [first = %{key: key3}|rest]) when sequences |> Kernel.length > 0 do
    IO.inspect sequences
    IO.inspect sequence

    if key1 == key3 do
      first |> mergeSequence(rest)
    else
      sequence |> mergeSequence(rest  ++ [first])
    end
  end

  def mergeSequence(sequence,_) do
    sequence
  end

  def parseInput(word = [first|rest]) when word |> Kernel.length > 0 do
    (first |> parseInput)  ++ (rest |> parseInput)
  end

  def parseInput(word) when word |> is_list do
    []
  end

  def parseInput(word) do
    words = word |> String.split([" "])
    [%{key: (words |> Enum.at(1)),after: words |> Enum.at(7)}]
  end
end

## xa2, xb2, xa1, xb1
##
##
##
##

### take each x bottomleft make sure x is more y is less than bottomleft of n but x is less y is more than topright then ntr - xbl
#bl %{x: 2, y: 8},
#tr %{x: 5, y: 5}

#bl %{x: 4, y: 5},
#tr   %{x: 7, y: 2}

#2,2 == 4
DaySevenPartOne.solve("Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.")