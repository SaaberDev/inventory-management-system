<?php

    use App\Http\Controllers\Admin\DashboardController;
    use App\Http\Controllers\Admin\Expense\ExpenseCategoryController;
    use App\Http\Controllers\Admin\Expense\ExpenseController;
    use App\Http\Controllers\Admin\Printable\PDFController;
    use App\Http\Controllers\Admin\Product\ProductTypeController;
    use App\Http\Controllers\Admin\Profile\ProfileController;
    use App\Http\Controllers\Admin\Purchase\PurchaseController;
    use App\Http\Controllers\Admin\Product\ProductController;
    use App\Http\Controllers\Admin\ReleasedProduct\ReleasedProductController;
use App\Http\Controllers\Admin\Sales\SalesController;
use App\Http\Controllers\Admin\Settings\Authorization\AdministrationController;
    use App\Http\Controllers\Admin\Settings\Authorization\RoleController;
    use App\Http\Controllers\Admin\Settings\ClientController;
    use App\Http\Controllers\Admin\Settings\SupplierController;
    use App\Http\Controllers\Admin\Settings\UnitController;
    use App\Http\Controllers\Admin\Settings\Warehouse\WarehouseController;
    use App\Http\Controllers\Admin\Stock\StockController;
    use App\Http\Controllers\Admin\Transfer\TransferController;
    use Illuminate\Support\Facades\Route;

    /*
    |--------------------------------------------------------------------------
    | Web Routes
    |--------------------------------------------------------------------------
    |
    | Here is where you can register web routes for your application. These
    | routes are loaded by the RouteServiceProvider within a group which
    | contains the "web" middleware group. Now create something great!
    |
    */

    /*
     * TODO - 1: Warehouse list active in sidebar
     * */

    Route::get('print_me/{code}', [PDFController::class, 'print_to_pdf'])->name('pdf'); // TODO -- Need Refactor
    Route::get('print_me_sale/{code}', [PDFController::class, 'print_to_pdf_sale'])->name('pdfSale'); // TODO -- Need Refactor


    Route::get('test', function () {
        //
    });


    Route::prefix('api')->middleware([
        'auth',
        'role:super_admin|admin|manager',
    ])->group(function () {
        Route::prefix('dashboard')->name('admin.')->group(function () {
            Route::prefix('purchase')->group(function () {
                // Get Raw Materials Ajax
                Route::get('/get-products', [PurchaseController::class, 'getProducts'])->name('getProducts');
                Route::get('/get-stock', [PurchaseController::class, 'getStock'])->name('getStock');
            });

            Route::prefix('transfer')->name('transfer.')->group(function () {
                Route::get('/get-products-by-warehouse', [TransferController::class, 'getProductsByWarehouse'])->name('getProductsByWarehouse');
                Route::get('/get-stock', [TransferController::class, 'getStock'])->name('getStock');
            });

            Route::prefix('products')->name('products.')->group(function () {
                Route::get('/', [ReleasedProductController::class, 'getProducts'])->name('getProducts');
                Route::get('/get-products-by-warehouse', [ReleasedProductController::class, 'getProductsByWarehouse'])->name('getProductsByWarehouse');
                Route::get('/get-stock', [ReleasedProductController::class, 'getStock'])->name('getStock');
            });
            Route::prefix('sales')->name('sales.')->group(function () {
                Route::get('/get-products', [SalesController::class, 'getProducts'])->name('getProducts');
//                Route::get('/get-products-by-warehouse', [ReleasedProductController::class, 'getProductsByWarehouse'])->name('getProductsByWarehouse');
                Route::get('/get-stock', [SalesController::class, 'getStock'])->name('getStock');
            });
        });
    });

    // Admin Dashboard
    Route::middleware([
        'auth'
    ])->group(function () {
        Route::prefix('/dashboard')->name('admin.')->group(function () {
            // Dashboard
            Route::get('/', [DashboardController::class, 'index'])->name('dashboard.index');

            // Products
            Route::prefix('products')
                ->name('product.')
                ->group(function () {
                Route::name('self.')->group(function () {
                    Route::get('/', [ProductController::class, 'index'])->name('index')->middleware(['permission:product.index']);
                    Route::get('/add', [ProductController::class, 'create'])->name('create')->middleware(['permission:product.create']);
                    Route::post('/store', [ProductController::class, 'store'])->name('store')->middleware(['permission:product.store']);
                    Route::get('/edit/{id}', [ProductController::class, 'edit'])->name('edit')->middleware(['permission:product.edit']);
                    Route::patch('/update/{id}', [ProductController::class, 'update'])->name('update')->middleware(['permission:product.update']);
                    Route::delete('/delete/{id}', [ProductController::class, 'destroy'])->name('delete')->middleware(['permission:product.delete']);
                });

                // Product Types
                Route::prefix('type')->name('type.')->group(function () {
                    Route::get('/', [ProductTypeController::class, 'index'])->name('index')->middleware(['permission:product_type.index']);
                    Route::get('/add', [ProductTypeController::class, 'create'])->name('create')->middleware(['permission:product_type.create']);
                    Route::post('/store', [ProductTypeController::class, 'store'])->name('store')->middleware(['permission:product_type.store']);
                    Route::get('/edit/{id}', [ProductTypeController::class, 'edit'])->name('edit')->middleware(['permission:product_type.edit']);
                    Route::patch('/update/{id}', [ProductTypeController::class, 'update'])->name('update')->middleware(['permission:product_type.update']);
                    Route::delete('/delete/{id}', [ProductTypeController::class, 'destroy'])->name('delete')->middleware(['permission:product_type.delete']);
                });
            });


            // Purchase
            Route::prefix('purchase')
                ->name('purchase.')
                ->group(function () {
                // Purchases
                Route::name('self.')->group(function () {
                    Route::get('/', [PurchaseController::class, 'index'])->name('index')->middleware(['permission:product_type.index']);
                    Route::get('/add', [PurchaseController::class, 'create'])->name('create')->middleware(['permission:purchase.create']);
                    Route::post('/store', [PurchaseController::class, 'store'])->name('store')->middleware(['permission:purchase.store']);
                    Route::get('/show/{code}', [PurchaseController::class, 'show'])->name('show')->middleware(['permission:purchase.show']);
                    Route::get('/edit/{id}', [PurchaseController::class, 'edit'])->name('edit')->middleware(['permission:purchase.edit']);
                    Route::patch('/update/{id}', [PurchaseController::class, 'update'])->name('update')->middleware(['permission:purchase.update']);
                    Route::delete('/delete/{id}', [PurchaseController::class, 'destroy'])->name('delete')->middleware(['permission:purchase.delete']);
//                    report
                    Route::get('/report', [PurchaseController::class, 'report'])->name('report')->middleware(['permission:dashboard.report.purchase']);
                    Route::get('/report-getdata', [PurchaseController::class, 'reportData'])->name('reportData');
                    // Dropzone Media Ajax
                    Route::get('/get-media', [PurchaseController::class, 'getMedia'])->name('getMedia');
                    Route::post('/store-media', [PurchaseController::class, 'storeMedia'])->name('storeMedia');
                    Route::delete('/delete-media', [PurchaseController::class, 'destroyMedia'])->name('deleteMedia');
                });

                // Damaged Purchase
//                Route::prefix('damaged')->name('damaged.')->group(function () {
//                    Route::get('/', [DamagedController::class, 'index'])->name('index');
//                    Route::get('/add', [DamagedController::class, 'create'])->name('create');
//                    Route::post('/store', [DamagedController::class, 'store'])->name('store');
//                    Route::get('/edit/{id}', [DamagedController::class, 'edit'])->name('edit');
//                    Route::patch('/update/{id}', [DamagedController::class, 'update'])->name('update');
//                    // Get Purchase Ajax
//                    Route::post('get-purchases/{id}', [DamagedController::class, 'getPurchase'])->name('getPurchase');
//                });

                // Purchase Inventory
//                Route::prefix('inventory')->name('inventory.')->group(function () {
//                    Route::get('/', [\App\Http\Controllers\Admin\Stock\StockController::class, 'index'])->name('index');
//                });
            });

            // Sales. code by rajia
            Route::prefix('sales')->name('sales.')->group(function () {
                // Purchases
                Route::name('self.')->group(function () {
                    Route::get('/', [SalesController::class, 'index'])->name('index')->middleware(['permission:sales.index']);
                    Route::get('/add', [SalesController::class, 'create'])->name('create')->middleware(['permission:sales.create']);
                    Route::post('/store', [SalesController::class, 'store'])->name('store')->middleware(['permission:sales.store']);
                    Route::get('/show/{code}', [SalesController::class, 'show'])->name('show')->middleware(['permission:sales.show']);
                    Route::get('/edit/{id}', [SalesController::class, 'edit'])->name('edit')->middleware(['permission:sales.edit']);
                    Route::patch('/update/{id}', [SalesController::class, 'update'])->name('update')->middleware(['permission:sales.update']);
                    Route::delete('/delete/{id}', [SalesController::class, 'destroy'])->name('delete')->middleware(['permission:sales.delete']);
                    Route::get('/report', [SalesController::class, 'report'])->name('report')->middleware(['permission:dashboard.report.sale']);
                    Route::get('/report-getdata', [SalesController::class, 'reportData'])->name('reportData');

                });
                });

            // Expense
            Route::prefix('expense')->name('expense.')->group(function () {
                // Expenses
                Route::name('self.')->group(function () {
                    Route::get('/', [ExpenseController::class, 'index'])->name('index')->middleware(['permission:expense.index']);
                    Route::get('/add', [ExpenseController::class, 'create'])->name('create')->middleware(['permission:expense.create']);
                    Route::post('/store', [ExpenseController::class, 'store'])->name('store')->middleware(['permission:expense.store']);
                    Route::get('/edit/{id}', [ExpenseController::class, 'edit'])->name('edit')->middleware(['permission:expense.edit']);
                    Route::patch('/update/{id}', [ExpenseController::class, 'update'])->name('update')->middleware(['permission:expense.update']);
                    Route::delete('/delete/{id}', [ExpenseController::class, 'destroy'])->name('delete')->middleware(['permission:expense.delete']);
                    Route::get('/report', [ExpenseController::class, 'report'])->name('report')->middleware(['permission:dashboard.report.expense']);
                    Route::get('/report-getdata', [ExpenseController::class, 'reportData'])->name('reportData');
                });

                // Category
                Route::prefix('category')->name('category.')->group(function () {
                    Route::get('/', [ExpenseCategoryController::class, 'index'])->name('index')->middleware(['permission:expense_category.index']);
                    Route::get('/add', [ExpenseCategoryController::class, 'create'])->name('create')->middleware(['permission:expense_category.create']);
                    Route::post('/store', [ExpenseCategoryController::class, 'store'])->name('store')->middleware(['permission:expense_category.store']);
                    Route::get('/edit/{id}', [ExpenseCategoryController::class, 'edit'])->name('edit')->middleware(['permission:expense_category.edit']);
                    Route::patch('/update/{id}', [ExpenseCategoryController::class, 'update'])->name('update')->middleware(['permission:expense_category.update']);
                    Route::delete('/delete/{id}', [ExpenseCategoryController::class, 'destroy'])->name('delete')->middleware(['permission:expense_category.delete']);
                });
            });

            // Transfer
            Route::prefix('transfer')->name('transfer.')->group(function () {
                // Role base transfer routes
                Route::get('/', [TransferController::class, 'index'])->name('index')->middleware(['permission:transfer.index']);
                Route::get('/add', [TransferController::class, 'create'])->name('create')->middleware(['permission:transfer.create']);
                Route::post('/store', [TransferController::class, 'store'])->name('store')->middleware(['permission:transfer.store']);
                Route::get('/edit/{id}', [TransferController::class, 'edit'])->name('edit')->middleware(['permission:transfer.edit']);
                Route::patch('/update/{id}', [TransferController::class, 'update'])->name('update')->middleware(['permission:transfer.update']);
                Route::delete('/delete/{id}', [TransferController::class, 'destroy'])->name('delete')->middleware(['permission:transfer.delete']);
                // Get Products By Warehouse Ajax
//                Route::post('get-products-by-warehouse/{id}', [TransferController::class, 'getProductsByWarehouse'])->name('getProductsByWarehouse');
            });

            // Stock
            Route::prefix('stock')->name('stock.')->group(function () {
                // Role base transfer routes
                Route::get('/{id}/warehouse/', [StockController::class, 'index'])->name('index')->middleware(['permission:stock.index']);
            });

            // Stock
            Route::prefix('release-product')->name('release.')->group(function () {
                // Role base transfer routes
                Route::get('/', [ReleasedProductController::class, 'index'])->name('index')->middleware(['permission:release.index']);
                Route::get('/add', [ReleasedProductController::class, 'create'])->name('create')->middleware(['permission:release.create']);
                Route::post('/store', [ReleasedProductController::class, 'store'])->name('store')->middleware(['permission:release.store']);
                Route::get('/edit/{id}', [ReleasedProductController::class, 'edit'])->name('edit')->middleware(['permission:release.edit']);
                Route::patch('/update/{id}', [ReleasedProductController::class, 'update'])->name('update')->middleware(['permission:release.update']);
            });

            // Settings
            Route::prefix('settings')->name('settings.')->group(function () {
                // Warehouse
                Route::prefix('warehouse')->name('warehouse.')->group(function () {
                    Route::get('/', [WarehouseController::class, 'index'])->name('index')->middleware(['permission:settings.warehouse.index']);
                    Route::get('/add', [WarehouseController::class, 'create'])->name('create')->middleware(['permission:settings.warehouse.create']);
                    Route::post('/store', [WarehouseController::class, 'store'])->name('store')->middleware(['permission:settings.warehouse.store']);
                    Route::get('/edit/{id}', [WarehouseController::class, 'edit'])->name('edit')->middleware(['permission:settings.warehouse.edit']);
                    Route::patch('/update/{id}', [WarehouseController::class, 'update'])->name('update')->middleware(['permission:settings.warehouse.update']);
                    Route::delete('/delete/{id}', [WarehouseController::class, 'destroy'])->name('delete')->middleware(['permission:settings.warehouse.delete']);
                });

                // Unit
                Route::prefix('unit')->name('unit.')->group(function () {
                    Route::get('/', [UnitController::class, 'index'])->name('index')->middleware(['permission:settings.unit.index']);
                    Route::get('/add', [UnitController::class, 'create'])->name('create')->middleware(['permission:settings.unit.create']);
                    Route::post('/store', [UnitController::class, 'store'])->name('store')->middleware(['permission:settings.unit.store']);
                    Route::get('/edit/{id}', [UnitController::class, 'edit'])->name('edit')->middleware(['permission:settings.unit.edit']);
                    Route::patch('/update/{id}', [UnitController::class, 'update'])->name('update')->middleware(['permission:settings.unit.update']);
                    Route::delete('/delete/{id}', [UnitController::class, 'destroy'])->name('delete')->middleware(['permission:settings.unit.delete']);
                });

                // Clients
                Route::prefix('suppliers')->name('suppliers.')->group(function () {
                    Route::get('/', [SupplierController::class, 'index'])->name('index')->middleware(['permission:settings.suppliers.index']);
                    Route::get('/add', [SupplierController::class, 'create'])->name('create')->middleware(['permission:settings.suppliers.create']);
                    Route::post('/store', [SupplierController::class, 'store'])->name('store')->middleware(['permission:settings.suppliers.store']);
                    Route::get('/edit/{id}', [SupplierController::class, 'edit'])->name('edit')->middleware(['permission:settings.suppliers.edit']);
                    Route::patch('/update/{id}', [SupplierController::class, 'update'])->name('update')->middleware(['permission:settings.suppliers.update']);
                    Route::delete('/delete/{id}', [SupplierController::class, 'destroy'])->name('delete')->middleware(['permission:settings.suppliers.delete']);
                });

                // Clients
                Route::prefix('clients')->name('clients.')->group(function () {
                    Route::get('/', [ClientController::class, 'index'])->name('index')->middleware(['permission:settings.clients.index']);
                    Route::get('/add', [ClientController::class, 'create'])->name('create')->middleware(['permission:settings.clients.create']);
                    Route::post('/store', [ClientController::class, 'store'])->name('store')->middleware(['permission:settings.clients.store']);
                    Route::get('/edit/{id}', [ClientController::class, 'edit'])->name('edit')->middleware(['permission:settings.clients.edit']);
                    Route::patch('/update/{id}', [ClientController::class, 'update'])->name('update')->middleware(['permission:settings.clients.update']);
                    Route::delete('/delete/{id}', [ClientController::class, 'destroy'])->name('delete')->middleware(['permission:settings.clients.delete']);
                });

                // Authorization
                Route::prefix('authorization')->name('authorization.')->group(function () {
                    // Group Permission
                    Route::prefix('/group-permission')->name('groupPermission.')->group(function () {
                        Route::get('/', [RoleController::class, 'index'])->name('index')->middleware(['permission:settings.group_permission.index']);
                        Route::get('/add', [RoleController::class, 'create'])->name('create')->middleware(['permission:settings.group_permission.create']);
                        Route::post('/store', [RoleController::class, 'store'])->name('store')->middleware(['permission:settings.group_permission.store']);
                        Route::get('/edit/{id}', [RoleController::class, 'edit'])->name('edit')->middleware(['permission:settings.group_permission.edit']);
                        Route::patch('/update/{id}', [RoleController::class, 'update'])->name('update')->middleware(['permission:settings.group_permission.update']);
                        Route::delete('/delete/{id}', [RoleController::class, 'destroy'])->name('delete')->middleware(['permission:settings.group_permission.delete']);
                    });

                    // Administration
                    Route::prefix('/administration')->name('administration.')->group(function () {
                        Route::get('/', [AdministrationController::class, 'index'])->name('index')->middleware(['permission:settings.administration.index']);
                        Route::get('/add', [AdministrationController::class, 'create'])->name('create')->middleware(['permission:settings.administration.create']);
                        Route::post('/store', [AdministrationController::class, 'store'])->name('store')->middleware(['permission:settings.administration.store']);
                        Route::get('/edit/{id}', [AdministrationController::class, 'edit'])->name('edit')->middleware(['permission:settings.administration.edit']);
                        Route::patch('/update/{id}', [AdministrationController::class, 'update'])->name('update')->middleware(['permission:settings.administration.update']);
                        Route::delete('/delete/{id}', [AdministrationController::class, 'destroy'])->name('delete')->middleware(['permission:settings.administration.delete']);
                    });
                });
            });

            // Profile
            Route::prefix('admin/profile')->name('profile.')->group(function () {
                Route::get('/{id}', [ProfileController::class, 'show'])->name('show');
                Route::patch('/update/{id}', [ProfileController::class, 'update'])->name('update');
            });
        });
    });


    Route::get('/blank', fn() => view('blank'));

//    Route::get('/dashboard', function () {
//        return view('dashboard');
//    })->middleware(['auth'])->name('dashboard');

    require __DIR__ . '/auth.php';


    // TODO - [Default Features] - Search, filter, sort by, pagination, export
    // TODO - Transfer -> Warehouse (Cutting n' Upper, UID: #CNU-1)
    // TODO - Supplier info and Company info to invoice and show details page
