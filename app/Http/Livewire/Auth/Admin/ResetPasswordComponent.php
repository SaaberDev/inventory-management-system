<?php

namespace App\Http\Livewire\Auth\Admin;

use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use Livewire\Component;

class ResetPasswordComponent extends Component
{
    protected $request;
    public $token;
    public $form = [
        'email' => '',
        'password' => '',
        'password_confirmation' => '',
    ];

    protected function rules()
    {
        return [
            'token' => 'required',
            'form.password' => ['required', 'confirmed', Rules\Password::defaults()],
        ];
    }

    protected function messages()
    {
        return [
            'form.password.required' => 'Password field is required.',
            'form.password.confirmed' => 'Password confirmation does not match.',
        ];
    }

    public function mount($request)
    {
        $this->request = $request;
        $this->token = $request->route('token');
        $this->form['email'] = $request->email;
    }

    public function store()
    {
        $this->validate();

        // Here we will attempt to reset the user's password. If it is successful we
        // will update the password on an actual user model and persist it to the
        // database. Otherwise we will parse the error and return the response.
        $status = Password::reset(
            [
                'email' => $this->form['email'],
                'password' => $this->form['password'],
                'password_confirmation' => $this->form['password_confirmation'],
                'token' => $this->token,
            ],
            function ($user) {
                $user->forceFill([
                    'password' => Hash::make($this->form['password']),
                    'remember_token' => Str::random(60),
                ])->save();

                event(new PasswordReset($user));
            }
        );

        // If the password was successfully reset, we will redirect the user back to
        // the application's home authenticated view. If there is an error we can
        // redirect them back to where they came from with their error message.
        return $status == Password::PASSWORD_RESET
            ? redirect()->route('admin.signin')->with('status', __($status))
            : back()->withInput(['email' => $this->form['email']])
                ->withErrors(['email' => __($status)]);
    }

    public function render()
    {
        return view('livewire.auth.admin.reset-password-component');
    }
}
