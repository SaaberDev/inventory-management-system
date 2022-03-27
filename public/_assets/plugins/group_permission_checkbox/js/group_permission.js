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
