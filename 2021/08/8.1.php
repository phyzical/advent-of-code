<?php


require "Helpers.php";
class DayEightPartOne
{
    function solve($filename)
    {
        $displays = DayEightPartOne::prepareInputs($filename);
        $digits = $this::calculateDigits($displays);
        echo array_reduce($digits["output"], function ($acc, $outputDisplay) {
            return $acc + array_reduce($outputDisplay, function ($acc2, $output) {
                if (array_search($output["number"], [-1, 1, 4, 7, 8])) {
                    $acc2 += 1;
                }
                return $acc2;
            }, 0);
        }, 0) . "\n";
    }

    static function calculateDigits($displays)
    {

        $digits = array_fill(0, 9, []);
        foreach ($displays as $index2 => $display) {
            $others = [];
            $one = "";
            $seven = "";
            $four = "";
            $eight = "";
            foreach ($display as $type => $inputs) {
                foreach ($inputs as $input) {
                    $length = strlen($input);
                    switch ($length) {
                        case 2:
                            $digits[$type][$index2][] = ["input" => $input, "number" => 1];
                            $one = $input;
                            break;
                        case 3:
                            $seven = $input;
                            $digits[$type][$index2][] = ["input" => $input, "number" => 7];
                            break;
                        case 4:
                            $four = $input;
                            $digits[$type][$index2][] = ["input" => $input, "number" => 4];
                            break;
                        case 7:
                            $eight = $input;
                            $digits[$type][$index2][] = ["input" => $input, "number" => 8];
                            break;
                        default:
                            $others[$length][] =  ["input" => $input, "type" => $type];
                            break;
                    }
                }
            }
            $a = array_diff(str_split($seven), str_split($one));
            $a = array_pop($a);
            $bd = array_diff(str_split($four), str_split($one));

            $cf = str_split($one);
            $eg = array_diff(str_split($eight), array_merge([$a], $bd, $cf));

            $others = array_map(function ($other) {
                return array_map(function ($otherer) {
                    $otherer["input"] = str_split($otherer["input"]);
                    return $otherer;
                }, $other);
            }, $others);

            foreach ($others as $length => $inputs) {
                $index = 0;
                $value = array_unique(array_reduce(array_map(function ($input) use ($inputs, &$index) {
                    $result = array_diff(array_merge($inputs[abs($index - 1)]["input"], $inputs[abs($index - 2)]["input"]), $input["input"]);
                    $index++;
                    return $result;
                }, $inputs), function ($acc, $input) {
                    return array_merge($acc, $input);
                }, []));

                switch ($length) {
                    case 5:
                        $cebf = $value;
                        break;
                    case 6:
                        $cde = $value;
                        break;
                }
            }
            $dbf = array_diff($cebf, $cde);

            $eb = array_diff($cebf, $cf);
            $b = array_diff($bd, $eb);
            $b = array_pop($b);
            $e = array_diff($eb, [$b]);
            $e = array_pop($e);
            $g = array_diff($eg, [$e]);
            $g = array_pop($g);
            $d = array_diff($bd, [$b]);
            $d = array_pop($d);
            $f = array_diff($dbf, [$b, $d]);
            $f =  array_pop($f);
            $c = array_diff($cf, [$f]);
            $c = array_pop($c);

            $numbers = [
                "0" => [$a, $b, $c, $e, $f, $g],
                "2" => [$a, $c, $d, $e, $g],
                "3" => [$a, $c, $d, $f, $g],
                "5" => [$a, $b, $d, $f, $g],
                "6" => [$a, $b, $d, $e, $f, $g],
                "9" => [$a, $b, $c, $d, $f, $g],

            ];
            $others = array_reduce($others, function ($acc, $other) {

                return array_merge($acc, $other);
            }, []);
            foreach ($others as $length => $input) {

                foreach ($numbers as $number => $numberInput) {

                    if ($input["type"]  == "output" && Helpers::arrays_equal($input["input"], $numberInput)) {
                        $digits[$input["type"]][$index2][] = ["input" => $input["input"], "number" => $number];
                    }
                }
            }
        }
        return $digits;
    }

    static function prepareInputs($filename)
    {
        return array_map(function ($input2) {
            return ["imput" => explode(" ", $input2[0]), "output" => explode(" ", $input2[1])];
        }, array_map(function ($input) {
            return explode(" | ", $input);
        }, Helpers::splitInputs($filename)));
    }
}

$class = new DayEightPartOne();
// $class->solve("/2021/8test.txt");
$class->solve("/2021/8.txt");
