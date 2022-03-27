<?php

    /**
     * List of application permissions
     */
    return [
        // Dashboard
        [
            'group_name' => 'dashboard',
            'prefix' => [
                'dashboard.report.sale',
                'dashboard.report.expense',
                'dashboard.report.purchase',
                'dashboard.report.damage',
            ],
            'title' => [
                'sale report',
                'expense report',
                'purchase report',
                'damage report',
            ]
        ],

        // Dashboard > Product
        [
            'group_name' => 'product',
            'prefix' => [
                'product.index',
                'product.create',
                'product.store',
                'product.edit',
                'product.update',
                'product.delete',
            ],
            'title' => [
                'view table',
                'create product',
                'store product',
                'edit product',
                'update product',
                'delete product',
            ]
        ],
        // Dashboard > Product Type
        [
            'group_name' => 'product_type',
            'prefix' => [
                'product_type.index',
                'product_type.create',
                'product_type.store',
                'product_type.edit',
                'product_type.update',
                'product_type.delete',
            ],
            'title' => [
                'view table',
                'create product type',
                'store product type',
                'edit product type',
                'update product type',
                'delete product type',
            ]
        ],

        // Dashboard > Sale
        [
            'group_name' => 'sales',
            'prefix' => [
                'sales.index',
                'sales.create',
                'sales.store',
                'sales.show',
                'sales.edit',
                'sales.update',
                'sales.delete',
            ],
            'title' => [
                'view table',
                'create sale',
                'store sale',
                'show sale',
                'edit sale',
                'update sale',
                'delete sale',
            ]
        ],


        // Dashboard > purchase
        [
            'group_name' => 'purchase',
            'prefix' => [
                'purchase.index',
                'purchase.create',
                'purchase.store',
                'purchase.show',
                'purchase.edit',
                'purchase.update',
                'purchase.delete',
            ],
            'title' => [
                'view table',
                'create purchase',
                'store purchase',
                'Show purchase',
                'edit purchase',
                'update purchase',
                'delete purchase',
            ]
        ],
        // Dashboard > expense
        [
            'group_name' => 'expense',
            'prefix' => [
                'expense.index',
                'expense.create',
                'expense.store',
                'expense.edit',
                'expense.update',
                'expense.delete',
            ],
            'title' => [
                'view table',
                'create expense',
                'store expense',
                'edit expense',
                'update expense',
                'delete expense',
            ]
        ],
        // Dashboard > expense_category
        [
            'group_name' => 'expense_category',
            'prefix' => [
                'expense_category.index',
                'expense_category.create',
                'expense_category.store',
                'expense_category.edit',
                'expense_category.update',
                'expense_category.delete',
            ],
            'title' => [
                'view table',
                'create expense category',
                'store expense category',
                'edit expense category',
                'update expense category',
                'delete expense category',
            ]
        ],

        // Dashboard > transfer
        [
            'group_name' => 'transfer',
            'prefix' => [
                'transfer.index',
                'transfer.create',
                'transfer.store',
                'transfer.edit',
                'transfer.update',
                'transfer.delete',
            ],
            'title' => [
                'view table',
                'create transfer',
                'store transfer',
                'edit transfer',
                'update transfer',
                'delete transfer',
            ]
        ],


        // Dashboard > stock
        [
            'group_name' => 'stock',
            'prefix' => [
                'stock.index'
            ],
            'title' => [
                'view table',
            ]
        ],
        // Dashboard > release-product
        [
            'group_name' => 'release',
            'prefix' => [
                'release.index',
                'release.create',
                'release.store',
                'release.edit',
                'release.update',
            ],
            'title' => [
                'view table',
                'create Release product',
                'store Release product',
                'edit Release product',
                'update Release product',
            ]
        ],
        // Dashboard > warehouse
        [
            'group_name' => 'warehouse',
            'prefix' => [
                'settings.warehouse.index',
                'settings.warehouse.create',
                'settings.warehouse.store',
                'settings.warehouse.edit',
                'settings.warehouse.update',
                'settings.warehouse.delete',
            ],
            'title' => [
                'view table',
                'create warehouse',
                'store warehouse',
                'edit warehouse',
                'update warehouse',
                'delete warehouse',
            ]
        ],
        // Dashboard > unit
        [
            'group_name' => 'unit',
            'prefix' => [
                'settings.unit.index',
                'settings.unit.create',
                'settings.unit.store',
                'settings.unit.edit',
                'settings.unit.update',
                'settings.unit.delete',
            ],
            'title' => [
                'view table',
                'create unit',
                'store unit',
                'edit unit',
                'update unit',
                'delete unit',
            ]
        ],
        // Dashboard > suppliers
        [
            'group_name' => 'suppliers',
            'prefix' => [
                'settings.suppliers.index',
                'settings.suppliers.create',
                'settings.suppliers.store',
                'settings.suppliers.edit',
                'settings.suppliers.update',
                'settings.suppliers.delete',
            ],
            'title' => [
                'view table',
                'create suppliers',
                'store suppliers',
                'edit suppliers',
                'update suppliers',
                'delete suppliers',
            ]
        ],

        // Dashboard > clients
        [
            'group_name' => 'clients',
            'prefix' => [
                'settings.clients.index',
                'settings.clients.create',
                'settings.clients.store',
                'settings.clients.edit',
                'settings.clients.update',
                'settings.clients.delete',
            ],
            'title' => [
                'view table',
                'create clients',
                'store clients',
                'edit clients',
                'update clients',
                'delete clients',
            ]
        ],

        // Settings > Administration
        [
            'group_name' => 'administration',
            'prefix' => [
                'settings.administration.index',
                'settings.administration.create',
                'settings.administration.store',
                'settings.administration.edit',
                'settings.administration.update',
                'settings.administration.delete',
            ],
            'title' => [
                'view administration list',
                'create administration',
                'view administration',
                'edit administration',
                'update administration',
                'delete administration',
            ]
        ],

        // Settings > Group Permission
        [
            'group_name' => 'group_permission',
            'prefix' => [
                'settings.group_permission.index',
                'settings.group_permission.create',
                'settings.group_permission.store',
                'settings.group_permission.edit',
                'settings.group_permission.update',
                'settings.group_permission.delete',
            ],
            'title' => [
                'view role list',
                'create role',
                'view role',
                'edit role',
                'update role',
                'delete role',
            ]
        ],
    ];
