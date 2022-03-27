<?php

    namespace App\Http\Controllers\Admin\Profile;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Profile\ProfileRequest;
    use App\Models\User;
    use Auth;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Response;
    use Illuminate\Support\Facades\Hash;
    use Str;
    use Throwable;

    class ProfileController extends Controller
    {
        /**
         * Display the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View|Response
         */
        public function show($id)
        {
            $user = User::with('roles')->findOrFail($id);
            return view('admin.pages.profile.update', compact('user'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param ProfileRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(ProfileRequest $request, $id)
        {
            DB::beginTransaction();
            try {
                $admin = User::findOrFail($id);
                $admin->update([
                    'name' => $request->input('name'),
                ]);

                if ($request->hasFile('avatar')) {
                    $admin->addMediaFromRequest('avatar')
                        ->sanitizingFileName(function ($fileName) {
                            $replace_duplicates = preg_replace("/(.)\\1+/", "$1", $fileName);
                            return Str::lower(Str::replace(['#', '/', '_', '\\', ' '], '-', $replace_duplicates));
                        })
                        ->toMediaCollection('avatar');
                }

                if ($request->input('password')) {
                    $admin->update([
                        'password' => Hash::make($request->input('password')),
                    ]);
                    DB::commit();
                    Auth::logout();
                    return redirect()
                        ->route('admin.signin')
                        ->with([
                            'alert-type' => 'warning_toast',
                            'message' => 'Your password has been changed. You need to signin again.',
                        ]);
                } else {
                    $admin->update([
                        'name' => $request->input('name'),
                        'password' => $admin->password,
                    ]);
                }

                DB::commit();
                return redirect()
                    ->back()
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => 'Profile Updated Successfully!',
                    ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Opps, Something went wrong!',
                ]);
            }
        }
    }
