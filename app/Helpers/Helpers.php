<?php

    use Carbon\Carbon;

    /**
     * @param $argument
     * @return string
     */
    function formatDMY($argument): string
    {
        return Carbon::parse($argument)->format('d/m/Y');
    }

    /**
     * @param $argument
     * @return string
     */
    function formatYMD($argument): string
    {
        return Carbon::parse($argument)->format('y/m/d');
    }

    /**
     * @param $argument
     * @return string
     */
    function formatYDM($argument): string
    {
        return Carbon::parse($argument)->format('y/d/m');
    }

    function sanitizeRole($argument): string
    {
        return ucwords(Str::replace('_', ' ', $argument));
    }

    function sanitizeQueryParamToUrl($param)
    {
        return Str::replace(' ', '-', Str::lower($param));
    }

    function sanitizeQueryParamToWords($param)
    {
        return ucwords(Str::replace('-', ' ', request()->query($param)));
    }



    function formatNumber($number)
    {
        if ($number == null) {
            return '0.00';
        } else {
            return Str::remove(',', number_format($number, 2));
        }
    }

    function getClassName($class)
    {
        $arr = preg_split('/(?=[A-Z])/', class_basename($class));
        array_shift($arr);
        array_pop($arr);
        return implode(' ', $arr);
    }

    function pretty_print($array)
    {
        return print('<pre>'.print_r($array, true).'</pre>');
    }

    function truncateTables($toTruncate)
    {
        \DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        foreach ($toTruncate as $table) {
            \DB::table($table)->truncate();
        }
        \DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
