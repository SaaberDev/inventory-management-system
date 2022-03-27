<?php

namespace App\Http\Requests\Admin\Profile;

use App\Rules\MatchOldPassword;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class ProfileRequest extends FormRequest
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
            case 'POST':
            case 'PUT':
            case 'DELETE':
                return [];
            case 'PATCH':
                return [
                    'name' => 'required',
                    'old_password' => ['nullable', new MatchOldPassword()],
                    'password' => ['required_with:old_password', 'confirmed', 'different:old_password', Password::default()],
                ];
            default: break;
        }
    }

    /**
     * @return string[]
     */
    public function messages()
    {
        return [
            'name.required' => 'Name field is required',
            'password.confirmed' => 'Password confirmation does not match.',
        ];
    }
}
