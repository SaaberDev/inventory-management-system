<div>
    @foreach($roles as $role)
        <button id="login_as_{{ $role }}" class="login_as btn btn-primary btn-block">Login as {{ ucwords(preg_replace('/[-,_]/', ' ', $role)) }}</button>
    @endforeach
</div>
