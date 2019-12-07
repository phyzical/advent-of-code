defmodule Helper do
  @moduledoc false

  def splitStringByNewLine(stringNums) do
    stringNums |> String.split("\n")
  end

  def convertListToInts(stringNums) do
    stringNums |> Enum.map(fn value ->
      value |> parseInt
    end)
  end

  def parseInt(num) do
    {val,""} = num |> Integer.parse
    val
  end

  def boolToInt(bool) when bool == true do
    1
  end

  def boolToInt(bool) when bool == false do
    0
  end

  def countNonNil([first|rest],result) when rest |> Kernel.length > 0 do
    rest |> countNonNil(result + boolToInt(!is_nil(first)))
  end

  def countNonNil(_,result) do
    result
  end
end