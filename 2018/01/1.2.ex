defmodule DayOnePartTwo do
  @moduledoc false

  def solve(stringNums) do
    stringNums |> Helper.splitStringByNewLine |> Helper.convertListToInts |> add([0])
  end

  def add([ firstNum | restNums ], results = [ lastResult | _ ] ) do
    key = lastResult+firstNum
    if results |> Enum.member?(key) do
      IO.puts "the result is: " <> Integer.to_string(key)
    else
      restNums ++ [firstNum] |> add([key] ++ results)
    end
  end
end
DayOnePartTwo.solve(File.read!('./2018/1.txt'))