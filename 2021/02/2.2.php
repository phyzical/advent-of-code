<?php


require "2.1.php";

class DayTwoPartTwo
{
    function solve($filename)
    {
        $inputs = DayTwoPartOne::prepareInputs($filename);
        $position = $this->calculatePosition($inputs);
        echo abs($position["x"] * $position["y"]) . "\n";
    }

    function calculatePosition($inputs)
    {
        $result = ["x" => 0, "y" => 0, "aim" => 0];
        foreach ($inputs as $input) {
            $direction = $input[0];
            $amount = $input[1];
            switch ($direction) {
                case "up":
                    $result["aim"] -= $amount;
                    break;
                case "down":
                    $result["aim"] += $amount;
                    break;
                case "forward":
                    $result["x"] += $amount;
                    $result["y"] += $result["aim"] * $amount;
                    break;
            }
        }
        return $result;
    }
}

$class = new DayTwoPartTwo();
// $class->solve("/2021/2test.txt");
$class->solve("/2021/2.txt");
