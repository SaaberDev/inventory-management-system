<div>
    @if(session()->has('status'))
        <div class="text-success text-center mb-3">
            {{ session('status') }}
        </div>
    @endif
    <form wire:submit.prevent="store">
        <div class="input-group mb-3">
            <input type="text"
                   wire:model.defer="email"
                   class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}"
                   placeholder="Email"
                   autofocus
            >
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                </div>
            </div>
            @if($errors->has('email'))
                <span class="invalid-feedback">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
            @endif
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block">Request new password</button>
            </div>
            <!-- /.col -->
        </div>
    </form>

    <p class="mt-3 mb-1">
        <a href="{{ route('admin.signin') }}">
            <i class="ion ion-ios-arrow-back"></i>
            Back to signin
        </a>
    </p>
</div>
