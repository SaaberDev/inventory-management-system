<?php

namespace App\Http\Requests\Admin\Purchase;

use Illuminate\Foundation\Http\FormRequest;

class PurchaseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        switch ($this->method()){
            case 'GET':
            case 'DELETE':
                return [];
            case 'POST':
                return [
                    'purchase_date' => 'required',
                    'supplier' => 'required',

                    'subTotal' => 'required',
                    'totalDiscount' => 'nullable',
                    'transportCost' => 'nullable',
                    'total' => 'required',

                    'payment_method' => 'required',
                    'payment_status' => 'required',

                    'note' => 'required'
                ];
            case 'PATCH':
                return [
                    'purchase_date' => 'required',
                    'supplier' => 'required',

                    'subTotal' => 'required',
                    'totalDiscount' => 'nullable',
                    'transportCost' => 'nullable',
                    'total' => 'required',

                    'total_paid' => 'required|lte:total',
                    'payment_method' => 'required',
                    'payment_status' => 'required',

                    'note' => 'required'
                ];
            default: break;
        }
    }
}
