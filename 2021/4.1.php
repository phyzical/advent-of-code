<?php


require "Helpers.php";
class DayFourPartOne
{
    function solve($filename)
    {
        $inputs = DayFourPartOne::prepareInputs($filename);
        echo $this::findWinningScores($inputs)[0]["score"] . "\n";
    }

    static function prepareInputs($filename)
    {
        $inputs = Helpers::splitInputs($filename);
        $inputs = array_reduce($inputs, function ($acc, $input) {
            if ($input == "") {
                $acc[count($acc)] = [];
            } else {
                $acc[count($acc) - 1][] = count($acc[0]) > 0 ? array_map(function ($split) {
                    return (int)trim($split);
                }, str_split($input, 3)) : $input;
            }
            return $acc;
        }, [[]]);
        $inputs[0] = array_map("intval", explode(",", $inputs[0][0]));
        return $inputs;
    }

    static function findWinningScores($inputs)
    {
        $winningScores = [];
        $currentDraws = [];
        $draws =  array_shift($inputs);
        foreach ($draws as $draw) {
            $currentDraws[] = $draw;
            foreach ($inputs as $gridIndex => $grid) {
                $board = array_reduce($grid, function ($acc, $row) {
                    return array_merge($row, $acc);
                }, []);
                foreach ($grid as $index => $row) {
                    $column = array_map(function ($row2) use ($index) {
                        return $row2[$index];
                    }, $grid);
                    if ((count($row) == count(array_intersect($row,  $currentDraws))) || (count($column) == count(array_intersect($column,  $currentDraws)))) {
                        $alreadyWon = current(array_filter(
                            $winningScores,
                            function ($winningScore) use ($gridIndex) {
                                return $winningScore["index"] === $gridIndex;
                            }
                        ));
                        if (!$alreadyWon) {
                            $winningScores[] = ["index" => $gridIndex, "score" => $draw * array_sum(array_diff($board,  $currentDraws))];
                        }
                    }
                }
            }
        }
        return $winningScores;
    }
}

$class = new DayFourPartOne();
// $class->solve("/2021/4test.txt");
$class->solve("/2021/4.txt");
