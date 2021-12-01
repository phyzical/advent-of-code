<?php

class Helpers
{
    static function getFileContents($filename)
    {
        $filename = getcwd() . $filename;
        $file = fopen($filename, "r");
        $fileContents = fread($file, filesize($filename));
        fclose($file);
        return $fileContents;
    }

    static function splitInputs($filename)
    {
        return explode("\n", Helpers::getFileContents($filename));
    }
}
