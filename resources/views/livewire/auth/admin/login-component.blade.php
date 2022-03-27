<div>
    @if(session()->has('status'))
        <div class="text-success text-center mb-3">
            {{ session('status') }}
        </div>
    @endif

    <form wire:submit.prevent="store">
        <div class="input-group mb-3">
            <input type="text"
                   wire:model.defer="form.email"
                   class="form-control {{ $errors->has('form.email') ? ' is-invalid' : '' }}"
                   placeholder="Email"
            >
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                </div>
            </div>
            @if($errors->has('form.email'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('form.email') }}</strong>
                </span>
            @endif
        </div>
        <div class="input-group mb-3">
            <input type="password"
                   wire:model.defer="form.password"
                   class="form-control {{ $errors->has('form.password') ? ' is-invalid' : '' }}"
                   placeholder="Password"
            >
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                </div>
            </div>
            @if($errors->has('form.password'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('form.password') }}</strong>
                </span>
            @endif
        </div>
        <div class="row">
            <div class="col-8">
                <label class="checkbox" for="remember_me">
                    <input class="form-check-input all"
                           wire:model="remember"
                           id="remember_me"
                           type="checkbox"
                    >
                    <span>Remember Me</span>
                </label>
            </div>
            <!-- /.col -->
            <div class="col-4">
                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
            <!-- /.col -->
        </div>
    </form>

    <p class="mb-1">
        @if (Route::has('admin.password.request'))
            <a href="{{ route('admin.password.request') }}">I forgot my password</a>
        @endif
    </p>
</div>
