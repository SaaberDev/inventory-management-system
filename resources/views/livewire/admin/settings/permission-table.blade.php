<div>
    <div class="card-header">
        <h3 class="card-title">Group Permission</h3>

        <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
                @include('admin.includes.search')
            </div>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
        <table style="width: 100%" class="table table-hover">
            <colgroup>
                <col span="1" style="width: 5%;">
                <col span="1" style="width: 10%;">
                <col span="1" style="width: 75%;">
                <col span="1" style="width: 10%;">
            </colgroup>

            <thead>
            <tr>
                <th>ID</th>
                <th>Role</th>
                <th>Assigned Permissions</th>
                <th class="text-sm-center">Action</th>
            </tr>
            </thead>
            <tbody>
            @forelse($roles as $role)
                <tr>
                    <td>{{ $role->id }}</td>
                    <td>{{ $role->name }}</td>
                    <td>
                        @forelse($role->permissions as $permissions)
                            <span class="badge badge-info text-capitalize font-weight-normal">{{ $permissions->title }}</span>
                        @empty
                            <span class="badge badge-light">No Permission Assigned</span>
                        @endforelse
                    </td>
                    <td>
                        <div class="d-flex justify-content-center">
                            @can('settings.group_permission.edit')
                                <a href="{{ route('admin.settings.authorization.groupPermission.edit', $role->id) }}"
                               class="btn p-0 mr-3"
                            >
                                <svg xmlns="http://www.w3.org/2000/svg" width="14.322" height="14.322"
                                     viewBox="0 0 14.322 14.322">
                                    <g transform="translate(-2.5 -2.203)">
                                        <path
                                            d="M8.907,6H4.313A1.313,1.313,0,0,0,3,7.313V16.5a1.313,1.313,0,0,0,1.313,1.313H13.5A1.313,1.313,0,0,0,14.815,16.5V11.907"
                                            transform="translate(0 -1.79)" fill="none" stroke="#000"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="1"></path>
                                        <path
                                            d="M18.892,3.226a1.392,1.392,0,1,1,1.969,1.969l-6.236,6.236L12,12.087l.656-2.626Z"
                                            transform="translate(-5.062 0)" fill="none" stroke="#000"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="1"></path>
                                    </g>
                                </svg>
                            </a>
                            @endcan
                            @can('settings.group_permission.delete')
                                <a href="{{ route('admin.settings.authorization.groupPermission.delete', $role->id) }}"
                               class="sweet_delete btn m-0 p-0"
                            >
                                <svg xmlns="http://www.w3.org/2000/svg" width="11.91" height="16.027"
                                     viewBox="0 0 11.91 16.027">
                                    <path
                                        d="M8.279,16.969a1.563,1.563,0,0,0,1.559,1.559h6.234a1.563,1.563,0,0,0,1.559-1.559V7.617H8.279ZM18.41,4.279H15.683L14.9,3.5h-3.9l-.779.779H7.5V5.838H18.41Z"
                                        transform="translate(-7 -3)" fill="none" stroke="#000"
                                        stroke-width="1"></path>
                                </svg>
                            </a>
                            @endcan
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4">No Roles Available</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
    <!-- /.card-body -->
</div>
