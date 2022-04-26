<?php


require "8.1.php";
class DayEightPartTwo
{
    function solve($filename)
    {
        $displays = DayEightPartOne::prepareInputs($filename);
        $digits = DayEightPartOne::calculateDigits($displays);
        echo array_reduce($digits["output"], function ($acc, $outputDisplay) {
            $value = array_reduce($outputDisplay, function ($acc2, $output) {
                return $acc2 . (string)$output["number"];
            }, "");
            echo $value . "\n";
            return $acc + intval($value);
        }, 0) . "\n";
    }
}

$class = new DayEightPartTwo();
$class->solve("/2021/8test.txt");
// $class->solve("/2021/8.txt");
