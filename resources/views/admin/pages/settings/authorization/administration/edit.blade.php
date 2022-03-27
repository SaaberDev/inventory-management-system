@extends('layouts.app-admin')
@section('title', '')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
    <style>
        .profile-img {
            position: relative;
        }
        .profile-img >img {
            width:200px;
            height:200px;
            object-fit: cover;
            border-radius: 50%;
        }
        .profile-img label img {
            position: absolute;
            bottom: 12px;
            right: 4px;
            width: 45px;
        }
        .profile-img input{
            display: none;
        }
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.settings.authorization.administration.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Admin</h3>
        </div>
        <div class="card-body">
            <form class="row" action="{{ route('admin.settings.authorization.administration.update', $user->id) }}" method="POST" autocomplete="off" enctype="multipart/form-data">
                @csrf @method('PATCH')
                <div class="col-sm-6">
                    <div class="setting-profile-info d-flex justify-content-center align-items-center" style="height: 100%;">
                        <div class="profile-img">
                            <img src="{{ optional($user)->getFirstMedia('avatar') ? $user->getFirstMedia('avatar')->getUrl() : asset('_assets/_default/no-preview-available.png') }}" id="profile-image" alt="dashboard" class="profile-user-img img-fluid img-circle">
                            <label for="profile-img">
                                <img src="{{ asset('_assets/_admin/images/camera.svg') }}" alt="dashboard" class="img-fluid">
                            </label>
                            <input type="file" name="avatar" id="profile-img">
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="name">Name<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="name"
                               value="{{ old('name', $user->name) }}"
                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                               id="name"
                               placeholder="Mahfuzur Rahman Saber"
                        >
                        @if($errors->has('name'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                        @endif
                    </div>

                    <div class="form-group">
                        <label for="designation">Designation</label>
                        <input type="text"
                               name="designation"
                               value="{{ old('designation', $user->designation) }}"
                               class="form-control"
                               id="designation"
                               placeholder="Backend Developer"
                        >
                    </div>

                    <div class="form-group">
                        <label for="email">Email<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="email"
                               value="{{ old('email', $user->email) }}"
                               class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}"
                               id="email"
                               placeholder="example@gmail.com"
                        >
                        @if($errors->has('email'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>

                    <div class="form-group">
                        <label>Role<span class="text-danger"> *</span></label>
                        <select class="form-control select2bs4 {{ $errors->has('role') ? ' is-invalid' : '' }}"
                                id="role"
                                name="role[]"
                                style="width: 100%;"
                                data-placeholder="Choose a role"
                                multiple
                        >
                            <option></option>
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}"
                                @foreach($user->roles as $assignedRoles)
                                    {{ in_array($role->id, old('role', [$assignedRoles->id]) ?: []) ? 'selected' : '' }}
                                    @endforeach
                                >
                                    {{ $role->name }}
                                </option>
                            @endforeach
                        </select>
                        @if($errors->has('role'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('role') }}</strong>
                            </span>
                        @endif
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-group" id="show_hide_password">
                            <input type="password"
                                   name="password"
                                   class="form-control {{ $errors->has('password') ? ' is-invalid' : '' }}"
                                   id="password"
                                   placeholder="Type Password"
                            >
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <a href="">
                                        <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                            @if($errors->has('password'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password_confirmation">Confirm Password</label>
                        <div class="input-group" id="show_hide_password">
                            <input type="password"
                                   name="password_confirmation"
                                   class="form-control"
                                   id="password_confirmation"
                                   placeholder="Re-type Password"
                            >
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <a href="">
                                        <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/select2/select2.js') }}"></script>
    <script>
        //Profile Image preview
        const profileImg = document.getElementById("profile-img");
        profileImg.addEventListener("change",(event)=>{
            var image = document.getElementById('profile-image');
            image.src = URL.createObjectURL(event.target.files[0]);
        });
    </script>
@endpush
