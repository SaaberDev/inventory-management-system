$(document).ready(function () {
    //All Permission
    $('#all').click(function () {
        $('.all').prop('checked', this.checked);
    });
    $('.all').change(function () {
        var check = ($('.all').filter(":checked").length == $('.all').length);
        $('#all').prop("checked", check);
    });

    //Dashboard Area
    $('#dashboard').click(function () {
        $('.dashboard').prop('checked', this.checked);
    });
    $('.dashboard').change(function () {
        var check = ($('.dashboard').filter(":checked").length == $('.dashboard').length);
        $('#dashboard').prop("checked", check);
    });

    //Product Area
    $('#product').click(function () {
        $('.product').prop('checked', this.checked);
    });
    $('.product').change(function () {
        var check = ($('.product').filter(":checked").length == $('.product').length);
        $('#product').prop("checked", check);
    });

    //Product Type Area
    $('#product_type').click(function () {
        $('.product_type').prop('checked', this.checked);
    });
    $('.product_type').change(function () {
        var check = ($('.product_type').filter(":checked").length == $('.product_type').length);
        $('#product_type').prop("checked", check);
    });

    // Sales Area
    $('#sales').click(function () {
        $('.sales').prop('checked', this.checked);
    });
    $('.sales').change(function () {
        var check = ($('.sales').filter(":checked").length == $('.sales').length);
        $('#sales').prop("checked", check);
    });

    // Purchase Area
    $('#purchase').click(function () {
        $('.purchase').prop('checked', this.checked);
    });
    $('.purchase').change(function () {
        var check = ($('.purchase').filter(":checked").length == $('.purchase').length);
        $('#purchase').prop("checked", check);
    });

    // Expense Area
    $('#expense').click(function () {
        $('.expense').prop('checked', this.checked);
    });
    $('.expense').change(function () {
        var check = ($('.expense').filter(":checked").length == $('.expense').length);
        $('#expense').prop("checked", check);
    });

    // Category Area
    $('#category').click(function () {
        $('.category').prop('checked', this.checked);
    });
    $('.category').change(function () {
        var check = ($('.category').filter(":checked").length == $('.category').length);
        $('#category').prop("checked", check);
    });

    // transfer Area
    $('#transfer').click(function () {
        $('.transfer').prop('checked', this.checked);
    });
    $('.transfer').change(function () {
        var check = ($('.transfer').filter(":checked").length == $('.transfer').length);
        $('#transfer').prop("checked", check);
    });

    // stock Area
    $('#stock').click(function () {
        $('.stock').prop('checked', this.checked);
    });
    $('.stock').change(function () {
        var check = ($('.stock').filter(":checked").length == $('.stock').length);
        $('#stock').prop("checked", check);
    });

    // release Area
    $('#release').click(function () {
        $('.release').prop('checked', this.checked);
    });
    $('.release').change(function () {
        var check = ($('.release').filter(":checked").length == $('.release').length);
        $('#release').prop("checked", check);
    });

    // unit Area
    $('#unit').click(function () {
        $('.unit').prop('checked', this.checked);
    });
    $('.unit').change(function () {
        var check = ($('.unit').filter(":checked").length == $('.unit').length);
        $('#unit').prop("checked", check);
    });

    // warehouse Area
    $('#warehouse').click(function () {
        $('.warehouse').prop('checked', this.checked);
    });
    $('.warehouse').change(function () {
        var check = ($('.warehouse').filter(":checked").length == $('.warehouse').length);
        $('#warehouse').prop("checked", check);
    });

    // clients Area
    $('#clients').click(function () {
        $('.clients').prop('checked', this.checked);
    });
    $('.clients').change(function () {
        var check = ($('.clients').filter(":checked").length == $('.clients').length);
        $('#clients').prop("checked", check);
    });

    // warehouse Area
    $('#suppliers').click(function () {
        $('.suppliers').prop('checked', this.checked);
    });
    $('.suppliers').change(function () {
        var check = ($('.suppliers').filter(":checked").length == $('.suppliers').length);
        $('#suppliers').prop("checked", check);
    });

    //Administration Area
    $('#administration').click(function () {
        $('.administration').prop('checked', this.checked);
    });
    $('.administration').change(function () {
        var check = ($('.administration').filter(":checked").length == $('.administration').length);
        $('#administration').prop("checked", check);
    });

    //Group-Permission Area
    $('#group_permission').click(function () {
        $('.group_permission').prop('checked', this.checked);
    });
    $('.group_permission').change(function () {
        var check = ($('.group_permission').filter(":checked").length == $('.group_permission').length);
        $('#group_permission').prop("checked", check);
    });
});
