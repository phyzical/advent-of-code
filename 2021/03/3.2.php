<?php


require "3.1.php";
class DayThreePartTwo
{
    function solve($filename)
    {
        $inputs = DayThreePartOne::prepareInputs($filename);
        $oxygen = $this->calculateRate($inputs);
        $co2 = $this->calculateRate($inputs, true);
        echo abs(bindec($oxygen) * bindec($co2)) . "\n";
    }

    function calculateRate($inputs, $max = false)
    {
        foreach (range(0, count($inputs[0]) - 1) as $index) {
            $bits = array_reduce($inputs, function ($acc, $input) use ($index) {
                $acc[] = $input[$index];
                return $acc;
            }, []);
            $counts = array_count_values($bits);
            if ($counts[0] == $counts[1]) {
                $bit = $max ? 1 : 0;
            } else {
                $value = $max ? max($counts) : min($counts);
                $bit = array_keys($counts, $value)[0];
            }

            $inputs = array_filter($inputs, function ($input) use ($bit, $index) {
                return $input[$index] == $bit;
            });
            if (count($inputs) == 1) {
                break;
            }
        }
        return array_reduce($inputs, function ($acc, $input) {
            return implode("", $input);
        });
    }
}

$class = new DayThreePartTwo();
// $class->solve("/2021/3test.txt");
$class->solve("/2021/3.txt");
