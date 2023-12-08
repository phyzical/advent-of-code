<?php


require "Helpers.php";
class DaySevenPartOne
{
    function solve($filename)
    {
        $inputs = DaySevenPartOne::prepareInputs($filename);
        $fuelCosts = $this::calculateFuelCosts($inputs);
        echo min($fuelCosts) . "\n";
    }

    static function calculateFuelCosts($inputs)
    {
        return array_map(function ($input) use ($inputs) {
            return array_reduce($inputs, function ($acc, $input2) use ($input) {
                return $acc + abs($input - $input2);
            }, 0);
        }, $inputs);
    }

    static function prepareInputs($filename)
    {
        return array_map("intval", explode(",", Helpers::getFileContents($filename)));
    }
}

$class = new DaySevenPartOne();
// $class->solve("/2021/7test.txt");
$class->solve("/2021/7.txt");
