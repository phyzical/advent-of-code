<?php


require "Helpers.php";
class DayNinePartOne
{
    function solve($filename)
    {
        $grid = DayNinePartOne::prepareInputs($filename);
        echo array_reduce($this::findLowPoints($grid), function ($acc, $input) {
            return $acc + $input["value"] + 1;
        }, 0) . "\n";
    }

    static function findLowPoints($grid)
    {
        $result = [];
        foreach ($grid as $y => $row) {
            foreach ($row as $x => $value) {
                $up =  $y > 0 ? $grid[$y - 1][$x] : 10;
                $down =  $y < count($grid) - 1 ? $grid[$y + 1][$x] : 10;
                $left = $x > 0 ? $row[$x - 1] : 10;
                $right = $x < count($row) - 1 ? $row[$x + 1] : 10;
                if ($up > $value && $down > $value && $left > $value && $right > $value) {
                    $result[] = ["x" => $x, "y" => $y, "value" =>  $value];
                }
            }
        }
        return $result;
    }

    static function prepareInputs($filename)
    {
        return array_map(function ($input) {
            return array_map(function ($input2) {
                return intval($input2);
            }, str_split($input));
        }, Helpers::splitInputs($filename));
    }
}

$class = new DayNinePartOne();
// $class->solve("/2021/9test.txt");
$class->solve("/2021/9.txt");
