<?php

namespace App\Http\Requests\Admin\Settings\Authorization;

use Illuminate\Foundation\Http\FormRequest;

class RoleRequest extends FormRequest
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
            case 'PUT':
            case 'POST':
                return [
                    'role_name' => 'required',
                    'dashboard' => 'nullable|required_without_all:administration,group_permission',
                    'administration' => 'nullable|required_without_all:dashboard,group_permission',
                    'group_permission' => 'nullable|required_without_all:administration,dashboard',
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
            'dashboard.required_without_all' => 'You must assign at least one permission to this role.',
            'administration.required_without_all' => 'You must assign at least one permission to this role.',
            'group_permission.required_without_all' => 'You must assign at least one permission to this role.',
        ];
    }
}
