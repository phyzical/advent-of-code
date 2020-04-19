defmodule DaySixPartOne do
  @moduledoc false

  def solve(input) do
    input |>
      Helper.splitStringByNewLine() |>
      parseInput |>
      findLargestArea
  end

  def parseInput(word = [first|rest]) when word |> Kernel.length > 0 do
    (first |> parseInput) ++ (rest |> parseInput)
  end

  def parseInput(word) when word |> is_list do
    []
  end

  def parseInput(word) do
    [x,y|_] = word |> String.split([", "])
    [%{
      x: x |> String.to_integer ,
      y: y |> String.to_integer
    }]
  end

  def findLargestArea(points) do
    (points |>
      findOuterBoundary |>
      getBoard |>
      findClosetPoints(points) |>
      Enum.filter(fn item -> !(item.closet |> is_list) end)  |>
      getLargestArea) + 1
  end

  def getLargestArea(points = [first|rest]) when points |> Kernel.length > 0 do
    leftOverPoints = points |> Enum.filter(fn item -> first.closet != item.closet end)
    result = (points |> Kernel.length) - (leftOverPoints |> Kernel.length)
    result2 = leftOverPoints |> getLargestArea
    if result > result2 do
      result
    else
      result2
    end
  end

  def getLargestArea(_) do
    0
  end

  def findClosetPoints(board = [first|rest],points) when board |> is_list and board |> Kernel.length > 0 do
    [first |> findClosetPoints(points)] ++ (rest |> findClosetPoints(points))
  end

  def findClosetPoints(board,_) when board |> is_list do
    []
  end

  def findClosetPoints(point,points = [first|rest]) when points |> Kernel.length > 0 do
    distance1 = abs(point.x - first.x) + abs(point.y - first.y)
    result2 = point |> findClosetPoints(rest)
    # need to mark equal distances aas void
    if distance1 == result2.distance do
      result2 |> Map.merge(%{closet: [first] ++ result2.closet})
    else if distance1 < result2.distance or result2.distance == 0  do
        point |> Map.merge(%{distance: distance1, closet: first})
      else
        result2
      end
    end
  end

  def findClosetPoints(_,_) do
    %{distance: 0, closet: []}
  end

  def getBoard(%{min: min, max: max}) do
    min.x..max.x |>
      Enum.reduce([],fn x,acc -> acc ++ ((min.y..max.y) |>
                                           Enum.map(fn y -> %{x: x,y: y, closet: nil}end))
      end)
  end

  def findOuterBoundary(points) do
    result = %{topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight
    } = points |> findBoundaryPoints
    newBoundary1 = if bottomLeft == bottomRight do
      if topLeft.x < bottomLeft.x do
        %{bottomLeft: %{x: topLeft.x, y: bottomLeft.y} }
      else
        %{bottomRight: %{x: topRight.x, y: bottomLeft.y }}
      end
    else
      %{}
    end

    newBoundary2 = if topLeft == topRight do
      if bottomRight.y > topRight.y do
        %{topRight: %{x: topRight.x, y: bottomRight.y }}
      else
        %{topLeft: %{x: topLeft.x, y: bottomLeft.y }}
      end
    else
      %{}
    end

    result = result |> Map.merge(newBoundary1 |> Map.merge( newBoundary2))

    %{min: %{x: result.topLeft.x, y: result.topLeft.y},
      max: %{x: result.bottomRight.x, y: result.bottomRight.y}
    }
  end

  def findBoundaryPoints(_ = [first ,second|rest]) do
    firstResult = %{topLeft: first,
                    topRight: first,
                    bottomLeft: first,
                    bottomRight: first
                  } |>  findBoundaryPoints(%{topLeft: second,
                                            topRight: second,
                                            bottomLeft: second,
                                            bottomRight: second
                                          })
    secondResult = rest |> findBoundaryPoints
    firstResult |>  findBoundaryPoints(secondResult)
  end

  def findBoundaryPoints([last]) do
    %{topLeft: last,
      topRight: last,
      bottomLeft: last,
      bottomRight: last
    }
  end

  def findBoundaryPoints(_) do
    %{}
  end

  def findBoundaryPoints(%{topLeft: tl1 = %{x: tlx1, y: tly1},
                                  topRight: tr1 = %{x: trx1, y: try1},
                                  bottomLeft: bl1 = %{x: blx1, y: bly1},
                                  bottomRight: br1 = %{x: brx1, y: bry1}
                                },
                          %{topLeft: tl2 = %{x: tlx2, y: tly2},
                            topRight: tr2 = %{x: trx2, y: try2},
                            bottomLeft: bl2 = %{x: blx2, y: bly2},
                            bottomRight: br2 = %{x: brx2, y: bry2}
                          }) do
    %{topLeft: if tlx1 <= tlx2 and tly1 <= tly2 do
                  tl1
                else
                  tl2
                end,
      topRight: if trx1 >= trx2 and try1 <= try2 do
                 tr1
               else
                 tr2
               end,
      bottomLeft: if blx1 <= blx2 and bly1 >= bly2 do
                   bl1
                 else
                   bl2
                 end,

      bottomRight: if brx1 >= brx2 and bry1 >= bry2 do
                  br1
                else
                  br2
                end}
  end

  def findBoundaryPoints(first,_) do
    first
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
test1Res = DaySixPartOne.solve(File.read!('./2018/6test.txt'))
test1Res |> IO.inspect
(test1Res == 17) |> IO.inspect
#2,2 == 4
DaySixPartOne.solve(File.read!('./2018/6.txt')) |> IO.inspect