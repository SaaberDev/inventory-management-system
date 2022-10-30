<?php

namespace App\Http\Requests\Admin\ReleasedProduct;

use Illuminate\Foundation\Http\FormRequest;

class ReleasedProductRequest extends FormRequest
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
            case 'POST':
                return [
                    'released_date' => 'required',
                    'released_from' => 'required',
                    'product_type' => 'required',
                    'finished_product' => 'required',
                    'quantity' => 'required',
                    'note' => 'required'
                ];
            case 'PATCH':
                return [
                    'released_date' => 'required',
                    'product_type' => 'required',
                    'finished_product' => 'required',
                    'quantity' => 'required',
                    'note' => 'nullable'
                ];
            default: break;
        }
    }
}
