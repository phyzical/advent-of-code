defmodule DayOnePartOne do
  @moduledoc false

  def solve(stringNums) do
    stringNums |> Helper.splitStringByNewLine |> Helper.convertListToInts |> add(0)
  end

  def add(stringNums = [first|rest], total) when Kernel.length(stringNums) != 0 do
    rest |> add(total+first)
  end

  def add(_,total) do
    IO.puts "the result is: " <> Integer.to_string(total)
  end
end

DayOnePartOne.solve(File.read!('./2018/1.txt'))