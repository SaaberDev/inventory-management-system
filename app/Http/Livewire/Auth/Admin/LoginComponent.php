<?php

namespace App\Http\Livewire\Auth\Admin;

use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Lockout;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Livewire\Component;

class LoginComponent extends Component
{
    public $form = [
        'email' => '',
        'password' => '',
    ];
    public $remember;

    protected $rules = [
        'form.email' => 'required|string|email:rfc,dns|exists:users,email',
        'form.password' => 'required|string',
    ];

    protected $messages = [
        'form.email.required' => 'Email field is required.',
        'form.email.email' => 'Invalid email address.',
        'form.email.exists' => 'This email do not match our records.',
        'form.password.required' => 'Password field is required.',
    ];

    /**
     * @throws ValidationException
     */
    public function store()
    {
        $this->validate();

        $this->authenticate();
        request()->session()->regenerate();

        if (Auth::check() && Auth::user()->hasAnyRole(['super_admin', 'admin'])) {
            session()->flash('url.intended');
            return redirect()->to(RouteServiceProvider::DASHBOARD);
        }
//        if (Auth::check() && Auth::user()->hasRole('user')) {
//            // Get intended url
//            $intended = request()->session()->get('url.intended');
//            // Check & flash intended url
//            if ($intended){
//                session()->flash('url.intended');
//                return redirect()->to($intended);
//            }
//            return redirect()->to(url()->previous());
//        }

        return redirect()->route('admin.signin');
    }

    /**
     * @throws ValidationException
     */
    public function authenticate()
    {
        $this->ensureIsNotRateLimited();

        if (!Auth::attempt($this->form, $this->remember)) {
            RateLimiter::hit($this->throttleKey());

            throw ValidationException::withMessages([
                'form.password' => __('auth.password'),
            ]);
        }

        RateLimiter::clear($this->throttleKey());
    }

    /**
     * @throws ValidationException
     */
    public function ensureIsNotRateLimited()
    {
        if (!RateLimiter::tooManyAttempts($this->throttleKey(), 2)) {
            return;
        }

        event(new Lockout(\request()));

        $seconds = RateLimiter::availableIn($this->throttleKey());

        throw ValidationException::withMessages([
            'form.email' => trans('auth.throttle', [
                'seconds' => $seconds,
                'minutes' => ceil($seconds / 60),
            ]),
        ]);
    }

    public function throttleKey()
    {
        return Str::lower($this->form['email']) . '|' . \request()->ip();
    }

    public function render()
    {
        return view('livewire.auth.admin.login-component');
    }
}
