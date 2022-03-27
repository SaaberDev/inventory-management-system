<?php

    namespace Database\Seeders;

    use DB;
    use Illuminate\Database\Seeder;
    use Spatie\Permission\Models\Permission;
    use Spatie\Permission\Models\Role;
    use Spatie\Permission\PermissionRegistrar;

    class RolePermissionSeeder extends Seeder
    {
        /**
         * Tables that will be truncate
         *
         * @return void
         */
        protected $toTruncate = ['permissions', 'roles'];

        /**
         * Run the database seeds.
         *
         * @return void
         */
        public function run()
        {
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');
            foreach ($this->toTruncate as $table) {
                DB::table($table)->truncate();
            }
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');

            // Reset cached roles and permissions
            app()[PermissionRegistrar::class]->forgetCachedPermissions();


            // Default roles
            $roles = [
                'super_admin',
                'admin',
                'manager',
                'accountant',
                'purchase'
            ];

            // Get array of roles except 'user' role
//            $rolesExceptUser = \Arr::except($roles, [4]);
            // Create 'admins' roles
//            foreach ($rolesExceptUser as $admin) {
//                Role::create([
//                    'name' => $admin,
//                    'guard_name' => 'admin'
//                ]);
//            }

            // Get array of roles except 'admin' role
//            $rolesExceptAdmin = \Arr::only($roles, [4]);
            // Create 'user' roles
            foreach ($roles as $role) {
                Role::create([
                    'name' => $role,
                    'guard_name' => 'web'
                ]);
            }

            // Assign all permission to super admin
            $super_admin = Role::findByName('super_admin');
            $admin = Role::findByName('admin');
            // List of all permissions
            $allPermissions = config('site-permissions');

            for ($i = 0; $i < count($allPermissions); $i++) {
                $permissionGroup = $allPermissions[$i]['group_name'];
                for ($ii = 0; $ii < count($allPermissions[$i]['prefix']); $ii++) {
                    // Create Permission
                    $permission = Permission::create([
                        'name' => $allPermissions[$i]['prefix'][$ii],
                        'group_name' => $permissionGroup,
                        'title' => $allPermissions[$i]['title'][$ii],
                        'guard_name' => 'web'
                    ]);
                    $super_admin->givePermissionTo($permission);
                    $admin->givePermissionTo($permission);
                }
            }

            // Assign all permission to manager
            $manager = Role::findByName('manager');
            $permission = Permission::whereIn('group_name', ['dashboard', 'administration'])->get();
            $manager->givePermissionTo($permission);
        }
    }
