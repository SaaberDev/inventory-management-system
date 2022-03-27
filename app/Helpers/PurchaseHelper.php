<?php

    /**
     * @param $total
     * @param $paid
     * @return string
     */
    function totalDue($total, $paid)
    {
        return formatNumber(($total - $paid));
    }

    /**
     * @param $purchase_qty
     * @param int $used_qty
     * @param int $damaged_qty
     * @return int
     */
    function availableQty($purchase_qty, $used_qty = 0, $damaged_qty = 0)
    {
        return ($purchase_qty - ($used_qty + $damaged_qty));
    }

    /**
     * @param $exception
     */
    function report_log($exception)
    {
        Log::channel('abuse')->info($exception->getMessage());
    }
