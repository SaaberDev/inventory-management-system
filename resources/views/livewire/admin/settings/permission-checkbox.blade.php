<div>
    <div class="row">
        <div class="col-sm-12 text-center">
            <label class="col-form-label">
                Assign Permissions
            </label>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-sm-12">
            <div>
                <div class="form-group">
                    <label class="checkbox">
                        <input class="form-check-input"
                               wire:model="selectGroup.dashboard"
                               value="dashboard"
                               id="dashboard"
                               type="checkbox"
                        >
                        <span>{{ permissionGroup($dashboardPermissions) }}</span>
                    </label>
                </div>
            </div>
            <hr>

            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        @foreach($dashboardPermissions as $dashboardPermission)
                            <label class="checkbox">
                                <input class="form-check-input"
                                       wire:model="selected"
                                       value="{{ $dashboardPermission->id }}"
                                       type="checkbox"
                                >
                                <span>{{ ucfirst($dashboardPermission->title) }}</span>
                            </label>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-sm-12">
            <label class="form-check-label text-bold" for="settings">Settings</label>
            <hr>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="checkbox" for="administration">
                            <input class="form-check-input"
                                   wire:model="selectGroup.administration"
                                   value="administration"
                                   id="administration"
                                   type="checkbox"
                            >
                            <span>{{ permissionGroup($administrationPermissions) }}</span>
                        </label>
                        <hr>

                        @foreach($administrationPermissions as $administrationPermission)
                            <label class="checkbox">
                                <input class="form-check-input"
                                       wire:model="selected"
                                       value="{{ $administrationPermission->id }}"
                                       type="checkbox"
                                >
                                <span>{{ ucfirst($administrationPermission->title) }}</span>
                            </label>
                        @endforeach
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="checkbox" for="group_permission">
                            <input class="form-check-input"
                                   wire:model="selectGroup.group_permission"
                                   value="group_permission"
                                   id="group_permission"
                                   type="checkbox"
                            >
                            <span>{{ permissionGroup($groupPermissions) }}</span>
                        </label>
                        <hr>

                        @foreach($groupPermissions as $groupPermission)
                            <label class="checkbox">
                                <input class="form-check-input"
                                       wire:model="selected"
                                       value="{{ $groupPermission->id }}"
                                       type="checkbox"
                                >
                                <span>{{ ucfirst($groupPermission->title) }}</span>
                            </label>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
