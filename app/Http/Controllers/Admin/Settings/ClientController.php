<?php

    namespace App\Http\Controllers\Admin\Settings;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\ClientRequest;
    use App\Models\Client;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Response;
    use Throwable;

    class ClientController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $clients = Client::all();
            return view('admin.pages.settings.clients.index', compact('clients'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            return view('admin.pages.settings.clients.create');
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param ClientRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(ClientRequest $request)
        {
            DB::beginTransaction();
            try {
                Client::create([
                    'name' => $request->input('name'),
                    'phone' => $request->input('phone'),
                    'email' => $request->input('email'),
                    'country' => $request->input('country'),
                    'city' => $request->input('city'),
                    'address' => $request->input('address'),
                ]);
                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Client Created Successfully!',
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
         * @return Application|Factory|View|Response
         */
        public function edit($id)
        {
            $client = Client::findOrFail($id);
            return view('admin.pages.settings.clients.edit', compact('client'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param ClientRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(ClientRequest $request, $id)
        {
            $client = Client::findOrFail($id);
            DB::beginTransaction();
            try {
                $client->update([
                    'name' => $request->input('name'),
                    'phone' => $request->input('phone'),
                    'email' => $request->input('email'),
                    'country' => $request->input('country'),
                    'city' => $request->input('city'),
                    'address' => $request->input('address'),
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.settings.clients.index')
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => 'Client Updated Successfully!',
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
        public function destroy($id)
        {
            DB::beginTransaction();
            try {
                $client = Client::findOrFail($id);
                $client->delete();
                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => 'Client Deleted Successfully!',
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
