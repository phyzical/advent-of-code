<?php


require "Helpers.php";
class DayFivePartOne
{
    function solve($filename)
    {
        $inputs = DayFivePartOne::prepareInputs($filename);
        $grid = $this->fillGrid($inputs, $this->filterLines($inputs));
        echo $this->calculateTotalOverlaps($grid, 2) . "\n";
    }

    static function prepareInputs($filename)
    {
        $inputs = Helpers::splitInputs($filename);
        return array_map(function ($input) {
            return array_map(function ($split) {
                return array_map("intval", explode(",", $split));
            }, explode(" -> ", $input));
        }, $inputs);
    }

    static function filterLines($inputs)
    {
        return array_reduce($inputs, function ($acc, $input) {
            if ($input[0][0] ==  $input[1][0] ||  $input[0][1] ==   $input[1][1]) {
                $acc = array_merge([["inputs" => $input, "diagonal" => false]], $acc);
            }
            return $acc;
        }, []);
    }


    static function fillGrid($inputs, $filteredLines)
    {
        $maxX =  max(array_reduce($inputs, function ($acc, $input) {
            return $acc + $input[0];
        }, []));
        $maxY =  max(array_reduce($inputs, function ($acc, $input) {
            return $acc + $input[1];
        }, []));
        $grid = array_map(function () use ($maxY) {
            return array_fill(0, $maxY + 1, ".");
        }, array_fill(0, $maxX + 1, []));

        array_map(function ($input) use (&$grid) {
            $x1 = $input["inputs"][0][0];
            $x2 = $input["inputs"][1][0];
            $y1 = $input["inputs"][0][1];
            $y2 = $input["inputs"][1][1];
            if ($input["diagonal"]) {
                $down = $y1 > $y2;
                $left = $x1 > $x2;
                $x = $x1;
                $y = $y1;
                foreach (range(0, abs($y1 - $y2)) as $xy) {
                    if ($grid[$y][$x] == ".") {
                        $grid[$y][$x] = 1;
                    } else {
                        $grid[$y][$x] += 1;
                    }

                    if ($down && $left) { # SW
                        $x -= 1;
                        $y -= 1;
                    } else if (!$down && $left) { # NW
                        $x -= 1;
                        $y += 1;
                    } else if ($down && !$left) { #SE
                        $x += 1;
                        $y -= 1;
                    } else { #NE
                        $x += 1;
                        $y += 1;
                    }
                }
            } else {
                foreach (range($y1, $y2) as $y) {
                    foreach (range($x1, $x2) as $x) {
                        if ($grid[$y][$x] == ".") {
                            $grid[$y][$x] = 1;
                        } else {
                            $grid[$y][$x] += 1;
                        }
                    }
                }
            }
        }, $filteredLines);
        return $grid;
    }

    static function calculateTotalOverlaps($grid, $overlapAmount)
    {
        return array_reduce($grid, function ($acc, $row) use ($overlapAmount) {
            return $acc + array_reduce($row, function ($acc2, $value) use ($overlapAmount) {
                if ($value >=  $overlapAmount) {
                    $acc2 += 1;
                }
                return $acc2;
            }, 0);
        }, 0);
    }
}

$class = new DayFivePartOne();
// $class->solve("/2021/5test.txt");
$class->solve("/2021/5.txt");
