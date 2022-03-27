<div>
    @if(session()->has('status'))
        <div class="text-success text-center mb-3">
            {{ session('status') }}
        </div>
    @endif

    <form wire:submit.prevent="store">
        <input type="hidden" name="token" wire:model="token">

        <div class="input-group mb-3">
            <input type="text"
                   wire:model.defer="form.email"
                   class="form-control"
                   placeholder="Email"
                   disabled
            >
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                </div>
            </div>
        </div>

        <div class="input-group mb-3">
            <input type="password"
                   wire:model.defer="form.password"
                   class="form-control {{ $errors->has('form.password') ? ' is-invalid' : '' }}"
                   placeholder="Password"
                   autofocus
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

        <div class="input-group mb-3">
            <input type="password"
                   wire:model.defer="form.password_confirmation"
                   class="form-control"
                   placeholder="Confirm Password"
            >
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block">Change password</button>
            </div>
            <!-- /.col -->
        </div>
    </form>
</div>
