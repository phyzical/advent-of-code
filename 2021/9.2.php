<?php


require "9.1.php";
class DayNinePartTwo
{
    function solve($filename)
    {
        $grid = DayNinePartOne::prepareInputs($filename);
        $lowPoints = DayNinePartOne::findLowPoints($grid);
        $basins = $this::findBasinSizes($grid, $lowPoints);
        rsort($basins);
        echo   $basins[0] * $basins[1] * $basins[2] . "\n";
    }

    static function findBasinSizes($grid, $lowPoints)
    {
        return array_map(function ($lowPoint) use ($grid) {
            return  count(DayNinePartTwo::countHigherPoints([], $lowPoint, $grid));
        }, $lowPoints);
    }

    static function countHigherPoints($result, $point, $grid)
    {
        $x = $point["x"];
        $y = $point["y"];
        $result[] = $x . $y;
        $up =  !array_search($x . ($y - 1), $result) && $y > 0 ? $grid[$y - 1][$x] : -99;
        $down =  !array_search($x . ($y + 1), $result) && $y < count($grid) - 1 ? $grid[$y + 1][$x] : -99;
        $left = !array_search(($x - 1) . $y, $result) && $x > 0 ? $grid[$y][$x - 1] : -199;
        $right = !array_search(($x + 1) . $y, $result) && $x < count($grid[$y]) - 1 ? $grid[$y][$x + 1] : -99;
        if ($up > 0 && $up != 9) {
            $result = array_unique(array_merge($result, DayNinePartTwo::countHigherPoints($result, ["value" => $up, "x" => $x, "y" => $y - 1], $grid)));
        }

        if ($down > 0 && $down != 9) {
            $result =  array_unique(array_merge($result, DayNinePartTwo::countHigherPoints($result, ["value" => $down, "x" => $x, "y" => $y + 1], $grid)));
        }

        if ($left > 0 && $left != 9) {
            $result =  array_unique(array_merge($result, DayNinePartTwo::countHigherPoints($result, ["value" => $left, "x" => $x - 1, "y" => $y], $grid)));
        }

        if ($right > 0 && $right != 9) {
            $result = array_unique(array_merge($result, DayNinePartTwo::countHigherPoints($result, ["value" => $right, "x" => $x + 1, "y" => $y], $grid)));
        }

        return $result;
    }
}

$class = new DayNinePartTwo();
$class->solve("/2021/9test.txt");
// $class->solve("/2021/9.txt");
