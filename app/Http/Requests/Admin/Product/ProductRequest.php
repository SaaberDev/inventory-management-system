<?php

namespace App\Http\Requests\Admin\Product;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
            case 'PUT':
            case 'PATCH':
            case 'POST':
                return [
                    'name' => 'required',
                    'product_type' => 'required',
                    'unit' => 'required',
                    'stock_alert_limit' => 'required',
                ];
            default: break;
        }
    }
}
