<?php

    namespace App\Services\Generator;

    class CodeGenerator
    {
        private $prefix;
        private $code;

        /**
         * Custom auto incrementing custom unique code generator based on prefix.
         *
         * @param $model        |   Model class instance
         * @param $shortcuts    |   Shortcuts can be multiple or single
         * @param $attribute    |   Auto incrementing table attribute
         * @return string       |   'assuming sale unique code i.e. SL0001, SL0002 and so on'.
         */
        public function reference($model, $shortcuts, string $attribute): string
        {
            if (!is_array($shortcuts)) {
                // simple code structure. i.e. ABC00001
                $this->prefix = $shortcuts;
            } else {
                // add " - " after each element except last one. i.e. ABC-XX00001
                $this->prefix = str_replace(',', '-', implode(',', $shortcuts));
            }

            $oldRecord = $model::where($attribute, 'LIKE', '%'.$this->prefix.'%')->get();
            if (count($oldRecord) > 0) {
                $max = $oldRecord->max($attribute);
//                dd($max);
                $serialNumber = str_replace($this->prefix, '', $max);
//                dd($serialNumber);
                $this->code = $this->prefix . str_pad(($serialNumber + 1), 5, '0', STR_PAD_LEFT);
//                dd($this->code );
            } else {
                $newRecord = $model::where($attribute, 'LIKE', '%'.$this->prefix.'%')->get();
                $this->code = $this->prefix . str_pad(($newRecord->count() + 1), 5, '0', STR_PAD_LEFT);
            }

            return $this->code;
        }
    }
