defmodule DaySixPartTwo do
  @moduledoc false

  def solve(input) do
    input |>
      Helper.splitStringByNewLine() |>
      parseInput |>
      findLargestArea |>
      Enum.filter(fn item -> item < 10000 end) |>
      Kernel.length |>
      IO.inspect
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
    points |>
       findOuterBoundary |>
       getBoard |>
       findClosetPoints(points)
  end

  def findClosetPoints(board = [first|rest],points) when board |> is_list and board |> Kernel.length > 0 do
    [first |> findClosetPoints(points)] ++ (rest |> findClosetPoints(points))
  end

  def findClosetPoints(board,_) when board |> is_list do
    []
  end

  def findClosetPoints(point,points = [first|rest]) when points |> Kernel.length > 0 do
    ( abs(point.x - first.x) + abs(point.y - first.y)) + (point |> findClosetPoints(rest))
  end

  def findClosetPoints(_,_) do
   0
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

#2,2 == 4
DaySixPartTwo.solve("264, 340
308, 156
252, 127
65, 75
102, 291
47, 67
83, 44
313, 307
159, 48
84, 59
263, 248
188, 258
312, 240
59, 173
191, 130
155, 266
252, 119
108, 299
50, 84
172, 227
226, 159
262, 177
233, 137
140, 211
108, 175
278, 255
259, 209
233, 62
44, 341
58, 175
252, 74
232, 63
176, 119
209, 334
103, 112
155, 94
253, 255
169, 87
135, 342
55, 187
313, 338
210, 63
237, 321
171, 143
63, 238
79, 132
135, 113
310, 294
289, 184
56, 259")