<?php


require "Helpers.php";
class DaySixPartOne
{
    function solve($filename)
    {
        $fish = DaySixPartOne::prepareInputs($filename);
        $fish = $this->breedFish($fish, 80);
        echo count($fish) . "\n";
    }

    static function breedFish($fish, $days)
    {
        foreach (range(0, $days - 1) as $day) {
            $newFish = [];

            foreach ($fish as $key => $fishy) {
                if (!$fishy) {
                    $fish[$key] = 6;
                    $newFish[] = 8;
                } else {
                    $fish[$key] = $fishy - 1;
                }
            }

            $fish = array_merge($fish, $newFish);
            echo "day: " . $day . "\n";
        }

        return $fish;
    }

    static function prepareInputs($filename)
    {
        return explode(",", Helpers::getFileContents($filename));
    }
}

$class = new DaySixPartOne();
// $class->solve("/2021/6test.txt");
$class->solve("/2021/6.txt");
