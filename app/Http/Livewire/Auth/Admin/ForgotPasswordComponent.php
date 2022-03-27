<?php

namespace App\Http\Livewire\Auth\Admin;

use Illuminate\Support\Facades\Password;
use Livewire\Component;

class ForgotPasswordComponent extends Component
{
    public $email;

    protected $rules = [
        'email' => 'required|string|email:rfc,dns|exists:users,email',
    ];

    protected $messages = [
        'email.required' => 'Email field is required.',
        'email.email' => 'Invalid email address.',
        'email.exists' => 'This email do not match our records.',
    ];

    public function store()
    {
        $this->validate();
        $status = Password::sendResetLink([
            'email' => $this->email
        ]);

        $status == Password::RESET_LINK_SENT
            ? back()->with('status', __($status))
            : back()->withInput(['email' => $this->email])
                ->withErrors(['email' => __($status)]);
        $this->reset('email');
    }

    public function render()
    {
        return view('livewire.auth.admin.forgot-password-component');
    }
}
