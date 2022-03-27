<?php

namespace App\Http\Requests\Admin\Product;

use App\Rules\Uppercase;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProductTypeRequest extends FormRequest
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
                    'name' => ['required', 'unique:product_types,name'],
                    'shortcut' => ['required', 'unique:product_types,shortcut', 'alpha', new Uppercase()],
                ];
            case 'PATCH':
                return [
                    'name' => ['required', Rule::unique('product_types')->ignore($this->id)],
                    'shortcut' => ['required', 'alpha', new Uppercase(), Rule::unique('product_types')->ignore($this->id)],
                ];
            default: break;
        }
    }
}
