<?php


require "5.1.php";
class DayFivePartTwo
{
    function solve($filename)
    {
        $inputs = DayFivePartOne::prepareInputs($filename);
        $grid = DayFivePartOne::fillGrid($inputs, $this->filterLines($inputs));
        echo DayFivePartOne::calculateTotalOverlaps($grid, 2) . "\n";
    }

    static function filterLines($inputs)
    {
        return array_reduce($inputs, function ($acc, $input) {
            if ($input[0][0] ==  $input[1][0] ||  $input[0][1] ==   $input[1][1]) {
                $acc = array_merge([["inputs" => $input, "diagonal" => false]], $acc);
            } else if (abs($input[0][1] - $input[1][1]) == abs($input[0][0] - $input[1][0])) {
                $acc = array_merge([["inputs" => $input, "diagonal" => true]], $acc);
            }
            return $acc;
        }, []);
    }
}

$class = new DayFivePartTwo();
// $class->solve("/2021/5test.txt");
$class->solve("/2021/5.txt");
