<?php

namespace App\Http\Requests\Admin\Settings\Authorization;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class AdministrationRequest extends FormRequest
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
            case 'PATCH':
                return [
                    'name' => 'required',
                    'designation' => 'nullable',
                    'email' => 'required|string|email:rfc,dns|max:255' . Rule::unique('users')->ignore($this->id),
                    'role' => 'required',
                    'password' => ['nullable', 'confirmed', Password::defaults()],
                ];
            case 'PUT':
            case 'POST':
                return [
                    'name' => 'required',
                    'designation' => 'nullable',
                    'email' => 'required|string|email:rfc,dns|max:255|unique:users',
                    'role' => 'required',
                    'password' => ['required', 'confirmed', Password::defaults()],
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
            'name.required' => 'Name field is required.',
            'email.required' => 'Email field is required.',
            'email.email' => 'Invalid email address.',
            'email.exists' => 'This email do not match our records.',
            'role.required' => 'Admin must be assigned with a role.',
            'password.required' => 'Password field is required.',
            'password.confirmed' => 'Password confirmation does not match.',
        ];
    }
}
