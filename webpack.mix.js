const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css', [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
]);

/**
 * Admin Dashboard
 */
mix
    // Core Assets
    .styles([
    'resources/_assets/_admin/css/adminlte.css',
], 'public/_assets/_admin/css/admin-dashboard.css')
    .scripts([
        'resources/_assets/plugins/jquery/jquery.js',
        'resources/_assets/plugins/bootstrap/js/bootstrap.bundle.js',
        'resources/_assets/_admin/js/adminlte.js',
        'resources/_assets/_admin/js/custom.js'
    ],'public/_assets/_admin/js/admin-dashboard.js')


    /**
     * Plugins
     */
    // Fontawesome
    .styles([
        'resources/_assets/plugins/fontawesome/css/all.css',
    ],'public/_assets/plugins/fontawesome/css/fontawesome.css')
    .copyDirectory('resources/_assets/plugins/fontawesome/webfonts', 'public/_assets/plugins/fontawesome/webfonts')

    // Flatpickr
    .styles([
        'node_modules/flatpickr/dist/flatpickr.css'
    ], 'public/_assets/plugins/flatpickr/flatpickr.css')
    .js([
        'node_modules/flatpickr/dist/flatpickr.js'
    ], 'public/_assets/plugins/flatpickr/flatpickr.js')

    // Dropzone
    .styles([
        'resources/_assets/plugins/dropzone/css/dropzone.css'
    ], 'public/_assets/plugins/dropzone/css/dropzone.css')
    .scripts([
        'resources/_assets/plugins/dropzone/js/dropzone.js'
    ], 'public/_assets/plugins/dropzone/js/dropzone.js')

    // Dynamic field - Purchase
    .scripts([
        'resources/_assets/plugins/dynamic_field/dynamic-field-purchase.js'
    ], 'public/_assets/plugins/dynamic_field/dynamic-field-purchase.js')

    // Dynamic field - Transfer
    .scripts([
        'resources/_assets/plugins/dynamic_field/dynamic-field-transfer.js'
    ], 'public/_assets/plugins/dynamic_field/dynamic-field-transfer.js')

    // Dynamic field - Released
    .scripts([
        'resources/_assets/plugins/dynamic_field/dynamic-field-released.js'
    ], 'public/_assets/plugins/dynamic_field/dynamic-field-released.js')

    // Dynamic field - Sales
    .scripts([
        'resources/_assets/plugins/dynamic_field/dynamic-field-sales.js'
    ], 'public/_assets/plugins/dynamic_field/dynamic-field-sales.js')

    // Chart.js
    .scripts([
        'resources/_assets/plugins/chart.js/Chart.bundle.js',
        'resources/_assets/plugins/chart.js/custom-Chart.js',
    ], 'public/_assets/plugins/chart.js/chart.js')

    // OverlayScrollbars
    .styles([
        'resources/_assets/plugins/overlayScrollbars/css/OverlayScrollbars.css',
    ],'public/_assets/plugins/overlayScrollbars/css/OverlayScrollbars.css')
    .scripts([
        'resources/_assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.js',
    ], 'public/_assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.js')

    // Select2
    .styles([
        'resources/_assets/plugins/select2/css/select2.css',
        'resources/_assets/plugins/select2/css/select2-bootstrap4.css',
        'resources/_assets/plugins/select2/css/custom.css'
    ], 'public/_assets/plugins/select2/select2.css')
    .scripts([
        'resources/_assets/plugins/select2/js/select2.full.js',
        'resources/_assets/plugins/select2/custom.js'
    ], 'public/_assets/plugins/select2/select2.js')

    // Icon Picker
    .styles([
        'resources/_assets/plugins/icon_picker/css/bootstrap-iconpicker.css'
    ], 'public/_assets/plugins/icon_picker/css/bootstrap-iconpicker.css')
    .js([
        'resources/_assets/plugins/icon_picker/js/bootstrap-iconpicker.bundle.min.js'
    ], 'public/_assets/plugins/icon_picker/js/bootstrap-iconpicker.bundle.min.js')


    // Custom JS
    .scripts([
        'resources/_assets/plugins/group_permission_checkbox/js/group_permission.js'
    ], 'public/_assets/plugins/group_permission_checkbox/js/group_permission.js')

    // Custom Css
    .styles([
        'resources/_assets/_admin/css/custom.css',
    ], 'public/_assets/_admin/css/custom.css')

    // Directory Copy
    .copyDirectory('resources/_assets/_admin/images', 'public/_assets/_admin/images')
    .copyDirectory('resources/_assets/_default', 'public/_assets/_default')

    // NoScript CSS
    .styles([
        'resources/_assets/_default/noscript.css'
    ], 'public/_assets/_default/noscript.css')

