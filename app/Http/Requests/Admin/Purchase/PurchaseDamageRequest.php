<?php

namespace App\Http\Requests\Admin\Purchase;

use Illuminate\Foundation\Http\FormRequest;

class PurchaseDamageRequest extends FormRequest
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
                    'reason' => 'required',
                    'damage_date' => 'required',
                    'purchase' => 'required',
                    'note' => 'required',
                ];
            default: break;
        }
    }
}
