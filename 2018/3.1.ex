defmodule DayThreePartOne do
  @moduledoc false

  def solve(input) do
    input = input |> Helper.splitStringByNewLine |> parseInput
    IO.puts input |> findOverlapAmount |> countOverlaps
  end

  def countOverlaps(overlaps) do
    overlaps |>
    Map.keys |>
    Enum.reduce(0,fn item,acc -> acc + (overlaps |> Map.get(item) |> Map.keys |> Kernel.length) end)
  end

  def parseInput(word = [first|rest]) when word |> Kernel.length > 0 do
    (first |> parseInput) ++ (rest |> parseInput)
  end

  def parseInput(word) when word |> is_list do
    []
  end

  def parseInput(word) do
    words = word |> String.replace(":","") |> String.split(" ")
    [left,top] = words |> Enum.at(2) |> String.split(",")
    [width,height] = words |> Enum.at(3) |> String.split("x")
    left = left |> String.to_integer
    top = top |> String.to_integer
    width = width |> String.to_integer
    height = height |> String.to_integer
    [%{
      topLeft: %{x: left , y: top },
    #  topRight: %{x: left + width, y: top },
     # bottomLeft: %{x: left,  y: top + height},
      bottomRight: %{x: left + width, y: top + height}
    }]
  end

  def findOverlapAmount(boxes = [first|rest]) when boxes |> Kernel.length > 0 and boxes |> is_list do
    (first |> findOverlapAmount(rest)) |> Map.merge(rest |> findOverlapAmount(), fn _,v1,v2 -> v1 |> Map.merge(v2) end)
  end

  def findOverlapAmount(_) do
    %{}
  end

  def findOverlapAmount(box ,boxes = [first|rest]) when boxes |> Kernel.length > 0 and boxes |> is_list do
    box |> checkBox(first) |> Map.merge(box |> findOverlapAmount(rest), fn _,v1,v2 -> v1 |> Map.merge(v2) end)
  end

  def findOverlapAmount(_,_) do
    %{}
  end

  def checkBox(%{bottomRight: %{x: ax1,y: ay1},topLeft: %{x: ax2,y: ay2}},%{bottomRight: %{x: bx1,y: by1},topLeft: %{x: bx2,y: by2}}) do
    topLeft = %{x: Kernel.max(ax2, bx2), y: Kernel.max(ay2, by2)}
    bottomRight = %{x:  Kernel.min(ax1, bx1), y: Kernel.min(ay1, by1)}
    result = %{}
    x = Kernel.max(0, bottomRight.x - topLeft.x )
    y = Kernel.max(0, bottomRight.y - topLeft.y )

    result = if x > 0 and y > 0 do
      for i <- 1..x do
        for j <- 1..y do
           %{i + topLeft.x => %{j + topLeft.y => nil}}
        end |>
        Enum.reduce(%{},fn item,acc ->
            acc |> Map.merge(item, fn _,v1,v2 -> v1 |> Map.merge(v2) end)
        end)
      end |>
      Enum.reduce(%{},fn item,acc ->
        acc |> Map.merge(item, fn _,v1,v2 -> v1 |> Map.merge(v2) end)
      end)
    else
      result
    end
    result
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
DayThreePartOne.solve(File.read!('./2018/3.txt'))