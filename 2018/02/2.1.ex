defmodule DayTwoPartOne do
  @moduledoc false

  def solve(input) do
    input = input |> Helper.splitStringByNewLine
    IO.puts Integer.to_string((input |> parseWordsForDuplicateLetters(2,0)) * (input |> parseWordsForDuplicateLetters(3,0)))
  end

  def parseWordsForDuplicateLetters([],_,total) do
    IO.puts total

    total
  end

  def parseWordsForDuplicateLetters([first|rest],multiple,total) do
    (rest |> parseWordsForDuplicateLetters(multiple,(first |> parseFindCharDuplicates(multiple,total))))
  end

  def parseFindCharDuplicates(word,multiple,total) when byte_size(word) > 0 do
    wordAfterReplace = word |> String.replace(String.first(word),"")
    hasMultiple = (String.length(word) - String.length(wordAfterReplace)) === multiple
    wordAfterReplace = if hasMultiple do
       ""
     else
       wordAfterReplace
    end
    wordAfterReplace |> parseFindCharDuplicates(
                multiple,
                total + Helper.boolToInt(hasMultiple)
              )
  end

  def parseFindCharDuplicates(_,_,total) do
    total
  end
end

DayTwoPartOne.solve(File.read!('./2018/2.txt'))