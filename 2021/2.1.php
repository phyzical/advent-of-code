<?php


require "Helpers.php";

class DayTwoPartOne
{
    function solve($filename)
    {
        $inputs = $this::prepareInputs($filename);
        $position = $this->calculatePosition($inputs);
        echo abs($position["x"] * $position["y"]) . "\n";
    }

    static function prepareInputs($filename)
    {
        $lines = Helpers::splitInputs($filename);
        return array_map(function ($line) {
            return explode(" ", $line);
        }, $lines);
    }

    function calculatePosition($inputs)
    {
        $result = ["x" => 0, "y" => 0];
        foreach ($inputs as $input) {
            $direction = $input[0];
            $amount = $input[1];
            switch ($direction) {
                case "up":
                    $result["y"] += $amount;
                    break;
                case "down":
                    $result["y"] -= $amount;
                    break;
                case "forward":
                    $result["x"] += $amount;
                    break;
            }
        }
        return $result;
    }
}

$class = new DayTwoPartOne();
// $class->solve("/2021/2test.txt");
$class->solve("/2021/2.txt");
