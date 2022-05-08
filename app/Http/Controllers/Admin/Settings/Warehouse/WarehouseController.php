<?php

    namespace App\Http\Controllers\Admin\Settings\Warehouse;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\WarehouseRequest;
    use App\Models\Warehouse;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Request;
    use Illuminate\Http\Response;
    use Throwable;

    class WarehouseController extends Controller
    {
        private $_className;

        public function __construct()
        {
            $this->_className = getClassName($this);
        }

        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View
         */
        public function index()
        {
            return view('admin.pages.settings.warehouse.index');
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            return view('admin.pages.settings.warehouse.create');
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param WarehouseRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(WarehouseRequest $request)
        {
            DB::beginTransaction();
            try {
                Warehouse::create([
                    'position' => Warehouse::count() + 1,
                    'icon' => $request->input('icon'),
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut'),
                ]);
                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => $this->_className . ' Created Successfully!',
                ]);
            } catch (Exception $exception) {
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
         * @return Application|Factory|View
         */
        public function edit($id)
        {
            $warehouse = Warehouse::findOrFail($id);
            return \view('admin.pages.settings.warehouse.edit', compact('warehouse'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param WarehouseRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(WarehouseRequest $request, $id)
        {
            $warehouse = Warehouse::findOrFail($id);
            DB::beginTransaction();
            try {
                $warehouse->update([
                    'icon' => $request->input('icon'),
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut'),
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.settings.warehouse.index')
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => $this->_className . ' Updated Successfully!',
                    ]);
            } catch (Exception $exception) {
                DB::rollBack();
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
         * @return JsonResponse
         * @throws Throwable
         */
        public function destroy(Request $request, $id)
        {
            DB::beginTransaction();
            try {
                $warehouse = Warehouse::findOrFail($id);
                $warehouse->delete();

                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => $this->_className . ' Deleted Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return \response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }
    }
