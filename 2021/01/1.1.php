<?php


require "Helpers.php";

class DayOnePartOne
{
    function solve($filename)
    {
        $inputs = $this::prepareInputs($filename);
        echo $this->countIncreasing($inputs) . "\n";
    }

    static function prepareInputs($filename)
    {
        return array_map("intval", Helpers::splitInputs($filename));
    }

    function countIncreasing($inputs)
    {
        $previous = $inputs[0];
        $total = 0;
        foreach ($inputs as $input) {
            $total += $input > $previous ? 1 : 0;
            $previous = $input;
        }
        return $total;
    }
}

$class = new DayOnePartOne();
// $class-->solve("/2021/1test.txt");
$class->solve("/2021/1.txt");
