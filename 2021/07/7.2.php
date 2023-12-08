<?php


require "7.1.php";
class DaySevenPartTwo
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
                $sum = array_reduce(range(0, abs($input2 - $input)), function ($acc2, $x) {
                    return $acc2 + $x;
                }, 0);
                return $acc + $sum;
            }, 0);
        }, range(0, max($inputs)));
    }
}

$class = new DaySevenPartTwo();
// $class->solve("/2021/7test.txt");
$class->solve("/2021/7.txt");
