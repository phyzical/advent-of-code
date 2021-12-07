<?php


require "Helpers.php";
class DaySixPartOne
{
    function solve($filename)
    {
        $fish = DaySixPartOne::prepareInputs($filename);
        $fish = $this->breedFish($fish, 80);
        echo array_sum($fish) . "\n";
    }

    static function breedFish($fish, $days)
    {
        $fishies = array_fill(0, 9, 0);

        foreach ($fish as $fishy) {
            $fishies[$fishy] += 1;
        }

        foreach (range(0, $days - 1) as $day) {
            $newFish = array_fill(0, 9, 0);
            foreach (range(8, 0) as $key) {
                $fishyCount  = $fishies[$key];
                if (!$key) {
                    $newFish[6] += $fishyCount;
                    $newFish[8] += $fishyCount;
                } else {
                    $newFish[$key - 1] = $fishyCount;
                }
            }
            $fishies =  $newFish;
        }

        return $fishies;
    }

    static function prepareInputs($filename)
    {
        return array_map("intval", explode(",", Helpers::getFileContents($filename)));
    }
}

$class = new DaySixPartOne();
// $class->solve("/2021/6test.txt");
$class->solve("/2021/6.txt");
