<?php


require "Helpers.php";
class DayThreePartOne
{
    function solve($filename)
    {
        $inputs = DayThreePartOne::prepareInputs($filename);
        $rates = $this->calculateRates($inputs);
        echo abs(bindec($rates["gamma"]) * bindec($rates["epsilon"])) . "\n";
    }

    static function prepareInputs($filename)
    {
        return array_map(function($line) {
            return array_map("intval", str_split($line));
        }, Helpers::splitInputs($filename));
    }

    function calculateRates($inputs)
    {
        $bits = [];
        foreach (range(0, count($inputs[0]) -1) as $index) {
            $bits[] = array_reduce($inputs, function($acc, $input) use(&$index) {
                $acc[] = $input[$index];
                return $acc;
            }, []);
        }

        $gamma = array_reduce($bits, function($acc, $input) {
            $max = array_count_values($input);
            return $acc.(string)array_keys($max, max($max))[0];
        }, "");
        $epsilon = array_reduce($bits, function($acc, $input) {
            $min = array_count_values($input);
            return $acc.(string)array_keys($min, min($min))[0];
        }, "");

        return [
            "gamma" => $gamma,
            "epsilon" => $epsilon
        ];
    }
}

$class = new DayThreePartOne();
// $class->solve("/2021/3test.txt");
$class->solve("/2021/3.txt");
