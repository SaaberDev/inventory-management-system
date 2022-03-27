<?php

namespace App\Http\Requests\Admin\Sales;

use Illuminate\Foundation\Http\FormRequest;

class SalesRequest extends FormRequest
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
                    'sales_date' => 'required',
                    'client' => 'required',
                    'products' => 'required',
                    'quantities' => 'required',
                    'note' => 'required'
                ];
            case 'PATCH':
                return [
                    'sales_date' => 'required',
                    'client' => 'required',
                    'products' => 'required',
                    'quantities' => 'required',
                    'note' => 'nullable'
                ];
            default: break;
        }
    }
}
