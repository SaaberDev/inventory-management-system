<?php

    namespace App\Http\Controllers\Admin\Settings;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\UnitRequest;
    use App\Models\Unit;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Response;
    use Throwable;

    class UnitController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $units = Unit::all();
            return view('admin.pages.settings.unit.index', compact('units'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            return \view('admin.pages.settings.unit.create');
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param UnitRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(UnitRequest $request)
        {
            DB::beginTransaction();
            try {
                Unit::create([
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut'),
                ]);
                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Unit Created Successfully!',
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

        /**
         * Display the specified resource.
         *
         * @param int $id
         * @return Response
         */
        public function show($id)
        {
            //
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View|Response
         */
        public function edit($id)
        {
            $unit = Unit::findOrFail($id);
            return \view('admin.pages.settings.unit.edit', compact('unit'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param UnitRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(UnitRequest $request, $id)
        {
            $unit = Unit::findOrFail($id);
            DB::beginTransaction();
            try {
                $unit->update([
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut'),
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.settings.unit.index')
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => 'Unit Updated Successfully!',
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

        /**
         * Remove the specified resource from storage.
         *
         * @param int $id
         * @return JsonResponse
         * @throws Throwable
         */
        public function destroy($id)
        {
            DB::beginTransaction();
            try {
                $unit = Unit::findOrFail($id);
                $unit->delete();
                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => 'Unit Deleted Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return \response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Opps, Something went wrong!',
                ]);
            }
        }
    }
