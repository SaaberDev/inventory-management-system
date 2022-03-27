<?php

namespace App\Http\Requests\Admin\Settings;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ClientRequest extends FormRequest
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
                    'name' => ['required'],
                    'phone' => ['required_without:email'],
                    'email' => ['required_without:phone',  'unique:clients'],
                    'country' => ['required'],
                    'city' => ['required'],
                    'address' => ['nullable'],
                ];
            case 'PATCH':
                return [
                    'name' => ['required'],
                    'phone' => ['required_without:email'],
                    'email' => ['required_without:phone', Rule::unique('clients')->ignore($this->id)],
                    'country' => ['required'],
                    'city' => ['required'],
                    'address' => ['nullable'],
                ];
            default: break;
        }
    }
}
