<?php


require "4.1.php";
class DayFourPartTwo
{
    function solve($filename)
    {
        $inputs = DayFourPartOne::prepareInputs($filename);
        $scores = DayFourPartOne::findWinningScores($inputs);
        echo array_pop($scores)["score"] . "\n";
    }
}

$class = new DayFourPartTwo();
// $class->solve("/2021/4test.txt");
$class->solve("/2021/4.txt");
