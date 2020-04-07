defmodule DayFivePartOne do
  @moduledoc false

  def solve(input) do
    input = input |>
      String.graphemes
      input |>
      reactInput(input,[]) |>
      Kernel.length |>
      IO.puts
  end

  def reactInput(map = [first,second|rest],input,result) when map |> Kernel.length > 1 do
    if first != second and (first |> String.capitalize) == (second |> String.capitalize) do
      rest |> reactInput(input,result)
    else
      ([second] ++ rest) |> reactInput(input,result ++ [first])
    end
  end

  def reactInput([last],input,result) do
    result = result ++ [last]
    if (input |> List.to_string) == (result |> List.to_string) do
      result
    else
      result |> reactInput(result,[])
    end
  end

  def reactInput(_,input,result) do
    if (input |> List.to_string) == (result |> List.to_string) do
      result
    else
      result |> reactInput(result,[])
    end
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
DayFivePartOne.solve(File.read!('./2018/5.txt'))
