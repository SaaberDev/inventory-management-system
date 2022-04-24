<?php

namespace App\Http\Controllers\Admin\Settings\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProductCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        \DB::beginTransaction();
        try {
            \DB::commit();
            return back()->with([
                'alert-type' => 'success_toast',
                'message' => 'ProductCategoryController Created Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
            report($exception);
            return back()->with([
                'alert-type' => 'warning_toast',
                'message' => 'Oops, Something went wrong!',
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        \DB::beginTransaction();
        try {
            // query here
            \DB::commit();
            return redirect()
                ->route('')
                ->with([
                'alert-type' => 'success_toast',
                'message' => 'ProductCategoryController Updated Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        \DB::beginTransaction();
        try {
            // query here
            \DB::commit();
            return response()->json([
                'alert_type' => 'success',
                'message' => 'ProductCategoryController Deleted Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
            report($exception);
            return response()->json([
                'alert_type' => 'warning',
                'message' => 'Oops, Something went wrong!',
            ]);
        }
    }
}
