defmodule DayFourPartOne do
  @moduledoc false

  def solve(input) do
    input |>
      Helper.splitStringByNewLine |>
      parseInput |>
      sortInput |>
    parseShift |>
    Enum.reduce(fn item,acc -> acc |> Map.merge(item, fn _,item,item2 -> item2 ++ item end) end) |>
    Enum.to_list() |>
    findLaziestGuard |>
    Enum.sort(fn item1,item2 -> item1.totalSleep <= item2.totalSleep end) |>
    IO.inspect
  end

  def findLaziestGuard(guards = [first|rest]) when guards |> Kernel.length > 0 and guards |> is_list do
    (first |> findLaziestGuard) ++ (rest |> findLaziestGuard)
  end

  def findLaziestGuard(guard = {_,sleeps}) do
    totalSleep = sleeps |> addSleep
    topSleepMin = sleeps |> sleepiestMin(sleeps)
    [%{guard: guard, totalSleep: totalSleep , topSleepMin: topSleepMin}]
  end

  def findLaziestGuard(_) do
    []
  end

  def addSleep(sleeps = [down,up|rest]) when sleeps |> Kernel.length > 0 and sleeps |> is_list do
    (up.up |> Time.diff(down.down))/60 + (rest |> addSleep)
  end

  def addSleep(_)  do
    0
  end

  def sleepiestMin(sleeps = [down,_|rest],sleepsOrig) when sleeps |> Kernel.length > 0 and sleeps |> is_list and sleepsOrig |> is_list do
    result = sleepsOrig |> sleepiestMin(down)
    result2 = rest |> sleepiestMin(sleeps)
    if result > result2 do
      down
    else
      result2
    end
  end

  def sleepiestMin(_,sleepsOrg) when sleepsOrg |> is_list do
    0
  end

  def sleepiestMin(sleeps = [down,up|rest],downTocheck) when sleeps |> is_list do
    Helper.boolToInt((up.up |> Time.diff(downTocheck.down)) > 0 and (down.down |> Time.diff(downTocheck.down)) <= 0) +
    (rest |> sleepiestMin(downTocheck))
  end

  def sleepiestMin(_,_) do
    0
  end

  def parseInput(word = [first|rest]) when word |> Kernel.length > 0 do
    (first |> parseInput) ++ (rest |> parseInput)
  end

  def parseInput(word) when word |> is_list do
    []
  end

  def parseInput(word) do
    words = word |> String.split(["[","]"])
    datetime = words |> Enum.at(1) |> String.split([" "])
    {_,time} = Time.from_iso8601((datetime |> Enum.at(1)) <> ":00");
    [%{
      word:  words |> Enum.at(2) |> String.trim(" "),
      time: time,
      date: Date.from_iso8601!(datetime |> Enum.at(0)),
    }]
  end

  def parseShift(word = [first|rest]) when word |> Kernel.length > 0 do
     if first.word == "falls asleep" do
       [%{down: first.time}] ++ (rest |> parseShift)
     else if first.word == "wakes up" do
          [%{up: first.time}] ++ (rest |> parseShift)
        else
         nextResult = rest |> parseShift
         id = first.word |> String.split("#") |> Enum.at(1) |> String.split(" ") |> Enum.at(0)
         restPeople =  nextResult |> Enum.filter(fn item -> item |> Map.keys |> List.first |> is_bitstring end)
         restSleep = nextResult |> Enum.filter(fn item -> !(item |> Map.keys |> List.first |> is_bitstring) and item |> Map.keys |> Kernel.length > 0 end)
          restPeople ++
          [%{ id =>
            restSleep
          }]
       end
     end
  end

  def parseShift(word) when word |> is_list do
    [%{}]
  end

  def sortInput(map) do
    map |> Enum.sort(
             fn a,b ->
              if (a.date |> Date.diff(b.date)) == 0 do
                (a.time |> Time.diff(b.time)) <= 0

              else
                (a.date |> Date.diff(b.date)) < 0
              end
            end)
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
DayFourPartOne.solve(File.read!('./2018/4.txt'))
