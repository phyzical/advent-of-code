<?php


require "6.1.php";
class DaySixPartTwo
{
    function solve($filename)
    {
        $fish = DaySixPartOne::prepareInputs($filename);
        $fish = DaySixPartOne::breedFish($fish, 256);
        echo array_sum($fish) . "\n";
    }
}

$class = new DaySixPartTwo();
// $class->solve("/2021/6test.txt");
$class->solve("/2021/6.txt");
