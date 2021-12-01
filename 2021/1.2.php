<?php


require "1.1.php";

class DayOnePartTwo
{
    function solve($file)
    {
        $inputs = DayOnePartOne::prepareInputs($file);
        echo $this->countIncreasingWindows($inputs, 3) . "\n";
    }

    function countIncreasingWindows($inputs, $size)
    {
        $previous = null;
        $total = 0;
        foreach ($inputs as $key => $input) {
            if ($key) {
                $window = array_slice($inputs, $key,  $size);
                $input = array_sum($window);
                $total += $previous && $input > $previous ? 1 : 0;
                $previous = $input;
            }
        }
        return $total;
    }
}

$class = new DayOnePartTwo();
// $class->solve("/2021/1test.txt");
$class->solve("/2021/1.txt");
