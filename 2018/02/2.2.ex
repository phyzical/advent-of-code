defmodule DayTwoPartTwo do
  @moduledoc false

  def solve(input) do
    input = input |> Helper.splitStringByNewLine
    IO.puts input |> findClosestMatch(Enum.to_list 1..10)
  end

  def findClosestMatch(list,differingChars = [first|rest]) when Kernel.length(differingChars) > 0 and is_list(differingChars) do
    result = list |> findClosestMatch(first)
    if result && result != "no match" do
      "IDs differed by " <> (first |> Integer.to_string) <> " and the answer is " <> result
    else
      list |> findClosestMatch(rest)
    end
  end

  def findClosestMatch(_,differingChars) when is_list(differingChars) do
    "no match"
  end

  def findClosestMatch(list = [first|rest],differingChars) when Kernel.length(list) > 0 do
    result = first |> checkList(rest,differingChars)
    if result do
      first |>
      String.graphemes |>
      Enum.with_index |>
      Enum.reduce("",fn {v,k},acc ->
        if is_nil(result |> Enum.at(k)) do
          acc <> v
        else
          acc
        end
      end)
    else
      rest |> findClosestMatch(differingChars)
    end
  end

  def findClosestMatch(_,_) do
    "no match"
  end

  def checkList(word1,list = [first|rest],differingChars) when is_list(list) and Kernel.length(list) > 0 do
    result = word1 |> returnDiffingLetters(first,[],0)
    if result && result |> Helper.countNonNil(0) == differingChars do
      result
    else
      word1 |> checkList(rest,differingChars)
    end
  end

  def checkList(_,list,_) when is_list(list) do
    false
  end

  def returnDiffingLetters(word1,word2,lettersToReplace, count) when count < byte_size(word1) do
    char = word1 |> String.at(count)

    lettersToReplace =
    if word2 |> String.at(count) == char do
      lettersToReplace ++ [nil]
    else
      lettersToReplace ++ [char]
    end

    word1  |>
      returnDiffingLetters(word2, lettersToReplace, count+1)
  end

  def returnDiffingLetters(_,_,lettersToReplace,_) do
    lettersToReplace
  end
end

DayTwoPartTwo.solve(File.read!('./2018/2.txt'))