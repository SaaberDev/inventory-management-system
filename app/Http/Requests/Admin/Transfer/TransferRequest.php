<?php

namespace App\Http\Requests\Admin\Transfer;

use Illuminate\Foundation\Http\FormRequest;

class TransferRequest extends FormRequest
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
                    'transfer_date' => 'required',
                    'transfer_from' => 'required',
                    'transfer_to' => 'required',
                    'products' => 'required',
                    'quantities' => 'required',
                    'note' => 'required',
                ];
            case 'PATCH':
                return [
                    'transfer_date' => 'required',
                    'transfer_to' => 'required',
                    'products' => 'required',
                    'quantities' => 'required',
                    'note' => 'required',
                ];
            default: break;
        }
    }
}
