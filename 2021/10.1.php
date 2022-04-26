<?php


require "Helpers.php";
class DayTenPartOne
{
    function solve($filename)
    {
        $inputs = DayTenPartOne::prepareInputs($filename);
        $corruption = DayTenPartOne::findCorruption($inputs);

        echo  array_reduce($corruption, function ($acc, $input) {
            $scores = [
                ")" => 3,
                "}" => 1197,
                ">" => 25137,
                "]" => 57,
            ];
            if (strlen($input) == 1) {
                echo $scores[$input] . "\n";
                $acc += $scores[$input];
            }
            return $acc;
        }, 0) . "\n";
    }

    static function findLastOpen($input, $matchCount)
    {
        $input = str_split($input);
        $currentCount = 0;
        while (count($input)) {
            $char = array_splice($input, -1, 1)[0];
            if ($char == "{" || $char == "[" || $char == "(" || $char == "<") {
                if ($matchCount == $currentCount) {
                    return $char;
                }
                $currentCount++;
            }
        }
    }

    static function findCorruption($inputs)
    {
        return array_map(function ($input) {
            $cleanedInput = "";
            $matchCount = 0;
            while (count($input)) {
                // isnt alsways index 0
                $char = array_splice($input, 0, 1)[0];
                $cleanedChar = DayTenPartOne::findLastOpen($cleanedInput, $matchCount);
                if (!strlen($cleanedInput)) {
                    $cleanedInput = $cleanedInput . $char;
                } else if ($char == "}" && $cleanedChar == "{") {
                    $cleanedInput = $cleanedInput . $char;
                    $matchCount++;
                } else if ($char == "]" && $cleanedChar == "[") {
                    $cleanedInput = $cleanedInput . $char;
                    $matchCount++;
                } else if ($char == ">" && $cleanedChar == "<") {
                    $cleanedInput = $cleanedInput . $char;
                    $matchCount++;
                } else if ($char == ")" && $cleanedChar == "(") {
                    $cleanedInput = $cleanedInput . $char;
                    $matchCount++;
                } else if ($char == "{" || $char == "[" || $char == "(" || $char == "<") {
                    $cleanedInput = $cleanedInput . $char;
                } else {
                    echo $cleanedInput . "\n";
                    echo $char . " " . $cleanedChar . "\n";
                    return $char;
                }
            }
            return  $cleanedInput;
        }, $inputs);
    }

    static function prepareInputs($filename)
    {
        return array_map(function ($input) {
            return str_split($input);
        }, Helpers::splitInputs($filename));
    }
}

$class = new DayTenPartOne();
$class->solve("/2021/10test.txt");
// $class->solve("/2021/10.txt");
