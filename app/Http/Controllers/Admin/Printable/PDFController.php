<?php

namespace App\Http\Controllers\Admin\Printable;

use App\Http\Controllers\Controller;
use App\Models\Purchase;
use App\Models\Sale;
use PDF;

class PDFController extends Controller
{
    public function print_to_pdf($code)
    {
        $purchase = Purchase::where('code', '=', $code)->firstOrFail();
        $pdf = PDF::loadView('admin.includes.printable.purchase_summary', ['purchase' => $purchase]);
        return $pdf->stream('purchase_invoice_' . $purchase->code . '.pdf');
    }
    public function print_to_pdf_sale($code)
    {
        $sale = Sale::where('code', '=', $code)->firstOrFail();
        $pdf = PDF::loadView('admin.includes.printable.sales_summary', ['sale' => $sale]);
        return $pdf->stream('sales_invoice_' . $sale->code . '.pdf');
    }
}
