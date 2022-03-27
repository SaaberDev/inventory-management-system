<?php

    use Tabuna\Breadcrumbs\Breadcrumbs;
    use Tabuna\Breadcrumbs\Trail;

    /*
    |--------------------------------------------------------------------------
    | Admin Panel Routes
    |--------------------------------------------------------------------------
    */

    /*
    | ----------------------> Dashboard <----------------------
    */
    // Dashboard
    Breadcrumbs::for('admin.dashboard.index', fn(Trail $trail) => $trail
        ->push('Dashboard', route('admin.dashboard.index'))
    );

    /*
    | ----------------------> Products <----------------------
    */
    // Dashboard > Products
    Breadcrumbs::for('admin.product.self.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Products', route('admin.product.self.index'))
    );

    // Dashboard > Add Product
    Breadcrumbs::for('admin.product.self.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Products', route('admin.product.self.index'))
        ->push('Add Product', route('admin.product.self.create'))
    );

    // Dashboard > Edit Product
    Breadcrumbs::for('admin.product.self.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Products', route('admin.product.self.index'))
        ->push('Edit Product', route('admin.product.self.edit', ['id']))
    );

    // Dashboard > Product Types
    Breadcrumbs::for('admin.product.type.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Product Types', route('admin.product.type.index'))
    );

    // Dashboard > Add Product Type
    Breadcrumbs::for('admin.product.type.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Product Types', route('admin.product.type.index'))
        ->push('Add Product Type', route('admin.product.type.create'))
    );

    // Dashboard > Edit Product Type
    Breadcrumbs::for('admin.product.type.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Product Types', route('admin.product.type.index'))
        ->push('Edit Product Type', route('admin.product.type.edit', ['id']))
    );

    /*
    | ----------------------> Purchase <----------------------
    */
    // Dashboard > Purchase
    Breadcrumbs::for('admin.purchase.self.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
    );
    // Dashboard > Purchase > Add New
    Breadcrumbs::for('admin.purchase.self.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Add New', route('admin.purchase.self.create'))
    );
    // Dashboard > Purchase > View Purchase
    Breadcrumbs::for('admin.purchase.self.show', fn(Trail $trail, $code) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push($code, route('admin.purchase.self.show', $code))
    );

    // Dashboard > Purchase > Edit Purchase
    Breadcrumbs::for('admin.purchase.self.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Edit Purchase', route('admin.purchase.self.edit', ['id']))
    );

    // Dashboard > Purchase > Damaged Purchases
    Breadcrumbs::for('admin.purchase.damaged.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Damaged Purchases', route('admin.purchase.damaged.index'))
    );
    // Dashboard > Purchase > Damaged Purchases > Add New
    Breadcrumbs::for('admin.purchase.damaged.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Damaged Purchases', route('admin.purchase.damaged.index'))
        ->push('Add New', route('admin.purchase.damaged.create'))
    );
    // Dashboard > Purchase > Damaged Purchases > Edit Purchase
    Breadcrumbs::for('admin.purchase.damaged.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Damaged Purchases', route('admin.purchase.damaged.index'))
        ->push('Edit Damaged Purchase', route('admin.purchase.damaged.edit', ['id']))
    );

    // Dashboard > Purchase > Inventory
    Breadcrumbs::for('admin.purchase.inventory.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Purchase', route('admin.purchase.self.index'))
        ->push('Inventory', route('admin.purchase.inventory.index'))
    );

    /*
    | ----------------------> Expense <----------------------
    */
    // Dashboard > Expenses
    Breadcrumbs::for('admin.expense.self.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expenses', route('admin.expense.self.index'))
    );

    // Dashboard > Add Expense
    Breadcrumbs::for('admin.expense.self.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expenses', route('admin.expense.self.index'))
        ->push('Add Expense', route('admin.expense.self.create'))
    );

    // Dashboard > Edit Expense
    Breadcrumbs::for('admin.expense.self.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expenses', route('admin.expense.self.index'))
        ->push('Edit Expense', route('admin.expense.self.edit', ['id']))
    );

    // Dashboard > Expense Categories
    Breadcrumbs::for('admin.expense.category.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expense Categories', route('admin.expense.category.index'))
    );

    // Dashboard > Add Expense Category
    Breadcrumbs::for('admin.expense.category.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expense Categories', route('admin.expense.category.index'))
        ->push('Add Expense Category', route('admin.expense.category.create'))
    );

    // Dashboard > Edit Expense Category
    Breadcrumbs::for('admin.expense.category.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Expense Categories', route('admin.expense.category.index'))
        ->push('Edit Expense Category', route('admin.expense.category.edit', ['id']))
    );

    /*
    | ----------------------> Transfer <----------------------
    */
    // Dashboard > Transfer
    Breadcrumbs::for('admin.transfer.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Transfers', route('admin.transfer.index'))
    );

    // Dashboard > Transfer > Add New
    Breadcrumbs::for('admin.transfer.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Transfers', route('admin.transfer.index'))
        ->push('Add New', route('admin.transfer.create'))
    );

    // Dashboard > Transfer > Edit Transfer
    Breadcrumbs::for('admin.transfer.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Transfers', route('admin.transfer.index'))
        ->push('Edit Transfer', route('admin.transfer.edit', ['id']))
    );

    /*
    | ----------------------> Released Products <----------------------
    */
    // Dashboard > Released Products
    Breadcrumbs::for('admin.release.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Released Products', route('admin.release.index'))
    );

    // Dashboard > Released Products
    Breadcrumbs::for('admin.release.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Released Products', route('admin.release.index'))
        ->push('Add', route('admin.release.create'))
    );

    // Dashboard > Released Products
    Breadcrumbs::for('admin.release.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Released Products', route('admin.release.index'))
        ->push('Edit', route('admin.release.edit', ['id']))
    );


    /*
    | ----------------------> Warehouses <----------------------
    */
    // Dashboard > Purchase
    Breadcrumbs::for('admin.stock.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push(sanitizeQueryParamToWords('name') . ' ' . 'Stock', route('admin.stock.index', ['id']))
    );

    /*
    | ----------------------> Settings <----------------------
    */

    /**
     * Warehouse
     */
    // Dashboard > Settings > Warehouse
    Breadcrumbs::for('admin.settings.warehouse.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Warehouses', route('admin.settings.warehouse.index'))
    );
    // Dashboard > Settings > Warehouse > Add New
    Breadcrumbs::for('admin.settings.warehouse.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Warehouses', route('admin.settings.warehouse.index'))
        ->push('Add New', route('admin.settings.warehouse.create'))
    );
    // Dashboard > Settings > Warehouse > Edit Warehouse
    Breadcrumbs::for('admin.settings.warehouse.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Warehouses', route('admin.settings.warehouse.index'))
        ->push('Edit Warehouse', route('admin.settings.warehouse.edit', ['id']))
    );


    /**
     * Unit
     */
    // Dashboard > Settings > Unit
    Breadcrumbs::for('admin.settings.unit.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Unit', route('admin.settings.unit.index'))
    );
    // Dashboard > Settings > Unit > Add New
    Breadcrumbs::for('admin.settings.unit.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Unit', route('admin.settings.unit.index'))
        ->push('Add New', route('admin.settings.unit.create'))
    );
    // Dashboard > Settings > Unit > Edit Unit
    Breadcrumbs::for('admin.settings.unit.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Unit', route('admin.settings.unit.index'))
        ->push('Edit Unit', route('admin.settings.unit.edit', ['id']))
    );

    /**
     * Suppliers
     */
    // Dashboard > Settings > Suppliers
    Breadcrumbs::for('admin.settings.suppliers.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Suppliers', route('admin.settings.suppliers.index'))
    );
    // Dashboard > Settings > Add New
    Breadcrumbs::for('admin.settings.suppliers.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Suppliers', route('admin.settings.suppliers.index'))
        ->push('Add New', route('admin.settings.suppliers.create'))
    );
    // Dashboard > Settings > Edit Supplier
    Breadcrumbs::for('admin.settings.suppliers.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Suppliers', route('admin.settings.suppliers.index'))
        ->push('Edit Supplier', route('admin.settings.suppliers.edit', ['id']))
    );

    /**
     * Clients
     */
    // Dashboard > Settings > Clients
    Breadcrumbs::for('admin.settings.clients.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Clients', route('admin.settings.clients.index'))
    );
    // Dashboard > Settings > Add New
    Breadcrumbs::for('admin.settings.clients.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Clients', route('admin.settings.clients.index'))
        ->push('Add New', route('admin.settings.clients.create'))
    );
    // Dashboard > Settings > Edit Client
    Breadcrumbs::for('admin.settings.clients.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Clients', route('admin.settings.clients.index'))
        ->push('Edit Client', route('admin.settings.clients.edit', ['id']))
    );

    /**
     * Group Permission
     */
    // Dashboard > Settings > Authorization > Group Permission
    Breadcrumbs::for('admin.settings.authorization.groupPermission.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Group Permission', route('admin.settings.authorization.groupPermission.index'))
    );
    // Dashboard > Settings > Authorization > Group Permission > Add New Role
    Breadcrumbs::for('admin.settings.authorization.groupPermission.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Group Permission', route('admin.settings.authorization.groupPermission.index'))
        ->push('Add New', route('admin.settings.authorization.groupPermission.create'))
    );
    // Dashboard > Settings > Authorization > Group Permission > Edit Role
    Breadcrumbs::for('admin.settings.authorization.groupPermission.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Group Permission', route('admin.settings.authorization.groupPermission.index'))
        ->push('Edit Role', route('admin.settings.authorization.groupPermission.edit', ['id']))
    );

    /**
     * Administration
     */
    // Dashboard > Settings > Authorization > Administration
    Breadcrumbs::for('admin.settings.authorization.administration.index', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Administration', route('admin.settings.authorization.administration.index'))
    );
    // Dashboard > Settings > Authorization > Add Admin
    Breadcrumbs::for('admin.settings.authorization.administration.create', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Administration', route('admin.settings.authorization.administration.index'))
        ->push('Add New', route('admin.settings.authorization.administration.create'))
    );
    // Dashboard > Settings > Authorization > Edit Admin
    Breadcrumbs::for('admin.settings.authorization.administration.edit', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Settings')
        ->push('Authorization')
        ->push('Administration', route('admin.settings.authorization.administration.index'))
        ->push('Edit Admin', route('admin.settings.authorization.administration.edit', ['id']))
    );

    /**
     * Profile
     */
    // Dashboard > Profile
    Breadcrumbs::for('admin.profile.show', fn(Trail $trail) => $trail
        ->parent('admin.dashboard.index')
        ->push('Admin')
        ->push('Profile', route('admin.profile.show', ['id']))
    );
