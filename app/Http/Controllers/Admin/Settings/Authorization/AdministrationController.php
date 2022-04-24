<?php

    namespace App\Http\Controllers\Admin\Settings\Authorization;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\Authorization\AdministrationRequest;
    use App\Models\User;
    use Carbon\Carbon;
    use DB;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Response;
    use Illuminate\Support\Facades\Hash;
    use Illuminate\Support\Facades\Log;
    use Spatie\Permission\Models\Role;
    use Str;
    use Throwable;

    class AdministrationController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $users = User::with('roles')->get();
            return view('admin.pages.settings.authorization.administration.index', compact('users'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            $roles = Role::query()
                ->select(['id', 'name'])
                ->orderBy('name')
                ->get();
            return \view('admin.pages.settings.authorization.administration.create', compact('roles'));
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param AdministrationRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(AdministrationRequest $request)
        {
            DB::beginTransaction();
            try {
                $explode = explode('@', $request->input('email'));
                $admin = User::create([
                    'name' => $request->input('name'),
                    'designation' => $request->input('designation'),
                    'username' => $explode[0],
                    'email' => $request->input('email'),
                    'email_verified_at' => Carbon::now(),
                    'password' => Hash::make($request->input('password')),
                    'remember_token' => Str::random(64),
                ]);

                $admin->assignRole($request->input('role'));

                if ($request->hasFile('avatar')) {
                    $admin->addMediaFromRequest('avatar')
                        ->sanitizingFileName(function($fileName) {
                            $replace_duplicates = preg_replace("/(.)\1{2}/", "$1", $fileName);
                            return Str::lower(Str::replace(['#', '/', '_', '\\', ' '], '-', $replace_duplicates));
                        })
                        ->toMediaCollection('avatar');
                }

                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Admin Created Successfully!',
                ]);
            } catch (\Exception $exception) {
                DB::rollBack();
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View|Response
         */
        public function edit($id)
        {
            $user = User::with('roles')->findOrFail($id);

            $roles = Role::query()
                ->select(['id', 'name'])
                ->orderBy('name')
                ->get();
            return \view('admin.pages.settings.authorization.administration.edit', compact('user', 'roles'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param AdministrationRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(AdministrationRequest $request, $id)
        {
            DB::beginTransaction();
            try {
                $admin = User::findOrFail($id);
                $explode = explode('@', $request->input('email'));
                $admin->update([
                    'name' => $request->input('name'),
                    'designation' => $request->input('designation'),
                    'username' => $request->input('email') ? $explode[0] : $admin->username,
                    'email' => $request->input('email'),
                    'email_verified_at' => Carbon::now(),
                    'password' => $request->input('password') ? Hash::make($request->input('password')) : $admin->password,
                    'remember_token' => Str::random(64),
                ]);

                $admin->syncRoles($request->input('role'));

                if ($request->hasFile('avatar')) {
                    $admin->addMediaFromRequest('avatar')
                        ->sanitizingFileName(function($fileName) {
                            $replace_duplicates = preg_replace("/(.)\\1+/", "$1", $fileName);
                            return Str::lower(Str::replace(['#', '/', '_', '\\', ' '], '-', $replace_duplicates));
                        })
                        ->toMediaCollection('avatar');
                }

                DB::commit();
                return redirect()
                    ->route('admin.settings.authorization.administration.index')
                    ->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Admin Updated Successfully!',
                ]);
            } catch (\Exception $exception) {
                DB::rollBack();
                Log::channel('abuse')->info($exception->getMessage());
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param int $id
         * @return \Illuminate\Http\JsonResponse
         * @throws Throwable
         */
        public function destroy($id)
        {
            DB::beginTransaction();
            try {
                $admin = User::findOrFail($id);
                $admin->delete();
                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => 'Admin Deleted Successfully!',
                ]);
            } catch (\Exception $exception) {
                DB::rollBack();
                report($exception);
                return \response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }
    }
