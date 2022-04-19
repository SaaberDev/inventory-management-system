(function(){
    "use strict";
    let products = [];
    // dynamic add product fields
    $(document).ready(function(){
        let maxField = 10;
        let x;
        let length = $("#product-count").val();
        let type = 'edit-calculator';
        if(length === undefined){
            x = 1;
            type = 'calculator';
        }else{
            x = length;
        }
        //Once add button is clicked
        $(".add_button").on("click", function () {
            let transfer_from =  $("#transfer_from option:selected").val();
            let product_id =  parseFloat($("#products-" + x).find(":selected").val());
            products.push(product_id);

            if (transfer_from) {
                $.ajax({
                    type: "GET",
                    dataType : 'json',
                    url: '/api/dashboard/transfer/get-products-by-warehouse',
                    data: {
                        id: transfer_from
                    }
                })
                    .done(function(data){
                        if(x < maxField){
                            x++;
                            // initSelect2();
                            let inputHtml = '';
                            // for(let key in data) {
                            $.each(data, function(key,value){
                                inputHtml += '<option value="'+value.id+'">'+ '>' + ' ' +value.code+ ' ' + '-' + ' ' +value.name+'</option>';
                            });
                            // }

                            $(".field_wrapper").append('<div class="row"> <div class="col-md-5 form-group"> <label for="products" class="col-form-label">Product Name<span class="text-danger"> *</span></label> <select class="form-control product-select select2bs4_el" id="products-' + x + '" name="products[]" style="width: 100%;" data-placeholder="Choose a Product" data-number="'+ x +'" required><option></option>'+inputHtml+'</select> </div> <div class="col-md-3"> <label for="stock-'+ x +'" class="col-form-label">Stock</label> <input type="text" class="form-control" name="stock" id="stock-'+ x +'" value="" disabled> </div> <div class="col-md-3 form-group"> <label for="qunatities" class="col-form-label">Quantity<span class="text-danger"> *</span></label> <input type="number" step="0.01" class="form-control ' + type + '" id="qunatities-' + x + '" data-number="' + x + '" name="quantities[]" placeholder="Quantity" min="1" > </div> <a class="col-md-1 remove_button btn btn-danger dynamic-btn updateTotalBtn" data-number="' + x + '" title="Remove" href="#" ><i class="fas fa-backspace"></i></a></div>');

                            let _thisTransferFrom = $("#transfer_from");

                            _thisTransferFrom.prop('disabled', true);
                            _thisTransferFrom.append('<input type="hidden" name="transfer_from" value="'+transfer_from+'"/>')

                            initSelect2();
                        }
                    })
                    .fail(function(){
                        console.log('Ajax Failed')
                    });
            } else {
                const WarningToast = Swal.mixin({
                    toast: true,
                    // position: 'bottom-left',
                    position: 'top-right',
                    showConfirmButton: false,
                    showCloseButton: true,
                    timer: 2500,
                    showClass: {
                        popup: 'swal2-show',
                        backdrop: 'swal2-backdrop-show',
                        icon: 'swal2-icon-show',
                    },
                    hideClass: {
                        popup: 'swal2-hide',
                        backdrop: 'swal2-backdrop-hide',
                        icon: 'swal2-icon-hide'
                    },
                    customClass: 'swal-toast-height',
                    // background: '#E9EFE8'
                    background: '#ffffff'
                })
                WarningToast.fire({
                    icon: 'warning',
                    title: "No warehouse selected"
                })
            }

        });
    });

    $(document).ready(function () {
        $('body').on('change', 'input.calculator', function(){
            let id =  $(this).data("number");
            let quantity = parseFloat($("#qunatities-"+id).val()) > 0 ?  parseFloat($("#qunatities-"+id).val()) :  0;
            let stock = parseFloat($("#stock-"+id).val()) > 0 ?  parseFloat($("#stock-"+id).val()) :  0;

            if (quantity <= 0) {
                Swal.fire({
                    text:"Quantity should be greater than Zero.",
                    icon: "warning",
                })
                $("#qunatities-"+id).val('');
            }
            if (stock < quantity){
                Swal.fire({
                    text:"Quantity should be less or Equal than Stock.",
                    icon: "warning",
                })
                $("#qunatities-"+id).val('');
            }
        });
    });

    $(document).ready(function () {
        $('body').on('change', 'select.product-select', function(){
            let id =  $(this).data("number");
            let product_id =  parseFloat($("#products-" + id).find(":selected").val());
            let warehouse_id =  parseFloat($("#transfer_from").find(":selected").val());

            if (jQuery.inArray(product_id, products) > -1) {
                Swal.fire({
                    text:"Product already selected.",
                    icon: "warning",
                });
                $("#products-"+id).val(null).trigger('change');
            } else {
                $.ajax({
                    type: "GET",
                    dataType : 'json',
                    url: '/api/dashboard/transfer/get-stock',
                    data: {
                        product_id: product_id,
                        warehouse_id: warehouse_id
                    }
                })
                    .done(function(data){
                        $("#stock-" + id).val(data.stock + ' ' + data.shortcut);
                    })
                    .fail(function(){
                        console.log('Ajax Failed')
                    });
            }
        });
    });


    $(document).ready(function () {
        //Once remove button is clicked
        $(".field_wrapper").on('click', '.remove_button', function(e){
            e.preventDefault();
            $(this).parent('div').remove();
            x--;
            if (x === 1) {
                let _thisTransferFrom = $("#transfer_from");
                _thisTransferFrom.prop('disabled', false);
                $(_thisTransferFrom, "input[type='hidden']").remove();
            }
        });
    })
})();


// Initialize select2
function initSelect2(){

    $(".select2bs4_el").select2({
        placeholder: 'Choose a product',
        theme: 'bootstrap4',
    });
}

function unique(list) {
    var result = [];
    $.each(list, function(i, e) {
        if ($.inArray(e, result) === -1) result.push(e);
    });
    return result;
}
