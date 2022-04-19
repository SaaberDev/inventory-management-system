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

    /**
     * @function for displaying image
     */
    if (!function_exists('showImage')) {
        /**
         * @spatie_media_library
         * This function will check if image exist on database or filesystem. If any one of them missing it will show a default image.
         * @param $model                | Pass model instance
         * @param $collectionName       | collection name
         * @param string $type          | single or multiple
         * @return string image url
         */
        function showImage($model, $collectionName, string $type = 'single')
        {
            if ($type === 'multiple') {
                $filePath = pathinfo($model->getPath(), PATHINFO_DIRNAME);
                $fileName = $model->file_name;
                $exists = checkIfDirectoryExists($filePath, $fileName);

                if (!$exists) {
                    return asset(config('dropzone.image.no_preview'));
                } else {
                    return asset(optional($model)->collection_name == $collectionName ? $model->getFullUrl() : config('dropzone.image.no_preview'));
                }
            } else {
                $fileName = optional($model)->getFirstMedia($collectionName) ? $model->getFirstMedia($collectionName)->file_name : null;
                $filePath = pathinfo($model->getFirstMediaPath($collectionName), PATHINFO_DIRNAME);
                $exists = checkIfDirectoryExists($filePath, $fileName);

                if (!$exists) {
                    return asset(config('dropzone.image.no_preview'));
                } else {
                    return asset(optional($model)->getFirstMedia($collectionName) ? $model->getFirstMediaUrl($collectionName) : config('dropzone.image.no_preview'));
                }
            }
        }
    }

    if (!function_exists('checkIfDirectoryExists')) {
        /**
         * @param $filePath
         * @param $fileName
         * @return bool
         */
        function checkIfDirectoryExists($filePath, $fileName)
        {
            $explode = explode('/', $filePath);
            $getLast = last($explode);
            return Storage::exists($getLast . '/' . $fileName);
        }
    }

    if (!function_exists('showAltText')) {
        /**
         * @param $model
         * @param $collectionName
         * @param $altText
         * @return \Illuminate\Config\Repository|\Illuminate\Contracts\Foundation\Application|mixed
         */
        function showAltText($model, $collectionName, $altText)
        {
            return optional($model)->getFirstMedia($collectionName) ? $altText : config('dropzone.image.alt');
        }
    }

    if (!function_exists('startIndexWithOne')) {

        function startIndexWithOne(array $array)
        {
            $count = count($array);
            for ($a = 0; $a < $count; ++$a) {
//                $months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
                array_unshift($array, "extra");
                unset($array[0]);
            }

            return $array;
        }
    }
