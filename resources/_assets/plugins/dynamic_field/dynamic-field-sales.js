(function(){
    "use strict";
    let products = [];
    const URL = '/api/dashboard/sales';
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
            let product_id =  parseFloat($("#products-" + x).find(":selected").val());
            products.push(product_id);
            $.ajax({
                type: "GET",
                dataType : 'json',
                url: URL + '/get-products',
            })
                .done(function(data){
                    console.log(data)
                    if(x < maxField){
                        x++;
                        // initSelect2();
                        let inputHtml = '';

                        $.each(data, function (key, value) {
                            inputHtml += '<optgroup label="'+value.name+'">';
                            $.each(value.products, function (key, value) {
                                inputHtml += '<option value="'+value.id+'">'+ ">" + ' ' +value.name+'</option></optgroup>'
                            });
                        });

                        $(".field_wrapper").append('<div class="row"> <div class="col-md-3 form-group"> <label for="products" class="col-form-label">Product Name<span class="text-danger"> *</span></label> <select class="form-control product-select select2bs4_el" id="products-' + x + '" name="products[]" style="width: 100%;" data-placeholder="Choose a Product" data-number="'+ x +'" required><option></option>'+inputHtml+'</select> </div><div class="col-md-3 form-group"> <div class="row"> <div class="col-md-6"> <label for="qunatities" class="col-form-label">Quantity<span class="text-danger"> *</span></label> <input type="number" step="0.01" class="form-control quantity ' + type + '" id="qunatities-' + x + '" data-number="' + x + '" name="quantities[]" placeholder="Quantity" min="1" > </div><div class="col-md-6"> <label for="stock-'+ x +'" class="col-form-label">Stock</label> <input type="text" class="form-control stock " name="stock" id="stock-'+ x +'" value="" disabled> </div></div></div><div class="col-md-3 form-group"> <div class="row"> <div class="col-md-6"> <label for="unitPrices[]" class="col-form-label">Unit Price<span class="text-danger"> *</span> </label> <input type="number" step="0.01" class="form-control ' + type + '" id="unitPrices-' + x + '" data-number="' + x + '" name="unitPrices[]" placeholder="Unit price" min="1" > </div><div class="col-md-6"> <label for="discounts[]" class="col-form-label">Discount(%)</label> <input type="number" step="any" min="0" class="form-control ' + type + '" id="discounts-' + x + '" data-number="' + x + '" name="discounts[]" placeholder="Discount"> </div></div></div><div class="col-md-2 form-group"> <label for="singleTotal[]" class="col-form-label">Product Total</label> <input type="text" class="form-control" id="singleTotal-' + x + '" name="singleTotal[]" placeholder="Product Total" readonly> </div><a class="col-md-1 remove_button btn btn-danger dynamic-btn updateTotalBtn" data-number="' + x + '" title="Remove" href="#" ><i class="fas fa-backspace"></i></a></div>');

                        initSelect2();
                    }
                })
                .fail(function(){
                    console.log('Ajax Failed')
                });
        });

        //Once remove button is clicked
        $(".field_wrapper").on('click', '.remove_button', function(e){
            e.preventDefault();
            $(this).parent('div').remove();
            x--;
        });
    });

    // calculate single total, sub total, total for purchase create
    var items =  [];
    $(document).ready(function(){
        $('body').on('change', 'input.calculator', function(){
            let id =  $(this).data("number");
            let quantity = parseFloat($("#qunatities-"+id).val()) > 0 ?  parseFloat($("#qunatities-"+id).val()) :  0;
            let stock = parseFloat($("#stock-"+id).val()) > 0 ?  parseFloat($("#stock-"+id).val()) :  0;
            let price = $("#unitPrices-"+id).val() > 0 ? $("#unitPrices-"+id).val() : 0;
            let discount = $("#discounts-"+id).val() > 0 ? $("#discounts-"+id).val() : 0;
            let subTotal = 0;
            let totalDiscount = 0;
            let singleTotal = quantity * price;
            $("#singleTotal-"+id).val(singleTotal - (discount / 100) * singleTotal);
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
            if(items.length == 0)
            {
                items.push({
                    id: id,
                    quantity:  quantity,
                    price:  price,
                    discount: discount
                });
            }
            else
            {
                if(items.some(e => e.id === id)) {
                    items[id-1].quantity = quantity;
                    items[id-1].price = price;
                    items[id-1].discount = discount;
                }
                else
                {
                    items.push({
                        id: id,
                        quantity:  quantity,
                        price:  price,
                        discount:  discount
                    });
                }
            }
            if(items.length > 0){
                subTotal = getTotal(items);
                totalDiscount = getTotalDiscount(items);
            }

            $("#subTotal").val(subTotal);
            $("#totalDiscount").val(totalDiscount);
            // calculate total with and transport cost
            let deliveryCharge = isNaN(parseFloat($("#transportCost").val())) ? 0 : parseFloat($("#transportCost").val());
            let total = subTotal + deliveryCharge;
            $("#total").val(total);
        });

    });

    // calculate single total, sub total, total for purchase edit
    $(document).ready(function(){
        $('body').on('change', 'input.edit-calculator', function(){
            let id =  $(this).data("number");
            let quantity = $("#qunatities-"+id).val() > 0 ?  $("#qunatities-"+id).val() :  0;
            let stock = $("#stock-"+id).val() > 0 ?  $("#stock-"+id).val() :  0;
            let price = $("#unitPrices-"+id).val() > 0 ? $("#unitPrices-"+id).val() : 0;
            let discount = $("#discounts-"+id).val() > 0 ? $("#discounts-"+id).val() : 0;
            let subTotal = 0;
            let singleTotal = quantity * price;
            let totalDiscount = 0;
            $("#singleTotal-"+id).val(singleTotal - (discount / 100) * singleTotal);
            let length = $("#product-count").val();
            if(stock < quantity){
                alert("Quantity should be less or Equal than Stock.");
                $("#qunatities-"+id).val('');
            }
            if(items.length == 0)
            {
                for(var i = 1; i <= length; i++)
                {
                    items.push({
                        id: i,
                        quantity: $("#qunatities-"+i).val(),
                        price:  $("#unitPrices-"+i).val(),
                        discount:  $("#discounts-"+i).val()
                    });
                }
            }
            else
            {
                if(items.some(e => e.id === id)) {
                    items[id-1].quantity = quantity;
                    items[id-1].price = price;
                    items[id-1].discount = discount;

                }
                else
                {
                    items.push({
                        id: id,
                        quantity:  quantity,
                        price:  price,
                        discount:  discount,
                    });
                }
            }
            if(items.length > 0){
                subTotal = getTotal(items);
                totalDiscount = getTotalDiscount(items);
            }
            $("#subTotal").val(subTotal);
            $("#totalDiscount").val(totalDiscount);
            let deliveryCharge = isNaN(parseFloat($("#transportCost").val())) ? 0 : parseFloat($("#transportCost").val());
            let total = subTotal + deliveryCharge;
            $("#total").val(total)
        });
    });

    // calculate sub total amount
    function getTotal(items)
    {
        let subTotal = 0;
        for(let i = 0; i < items.length; i++)
        {
            let singleTotal = parseFloat(items[i].quantity) * parseFloat(items[i].price);
            let discount =  (items[i].discount / 100) * singleTotal;
            subTotal += singleTotal -  discount;
        }
        return subTotal;
    }

    // calculate total discount
    function getTotalDiscount(items)
    {
        let totalDiscount = 0;
        for(let i = 0; i < items.length; i++)
        {
            let singleTotal = parseFloat(items[i].quantity) * parseFloat(items[i].price);
            let discount =  (items[i].discount / 100) * singleTotal;
            totalDiscount +=  discount;
        }
        return totalDiscount;
    }

    $(document).ready(function () {
        $('body').on('change', 'select.product-select', function(){
            let id =  $(this).data("number");
            let product_id =  parseFloat($("#products-" + id).find(":selected").val());

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
                    url: URL + '/get-stock',
                    data: {
                        id: product_id
                    }
                })
                    .done(function(data){
                        $("#stock-" + id).val(data.stock + ' ' + data.shortcut)
                    })
                    .fail(function(){
                        console.log('Ajax Failed')
                    });
            }
        });
    });

    // calculate total when remove a row
    $(document).ready(function(){
        $(".field_wrapper").on('click', '.remove_button', function(e){
            let num = $(this).data("number") - 1;
            let subTotal = $("#subTotal").val();
            let totalDiscount = $("#totalDiscount").val();
            if (num > -1) {
                items.splice(num, 1);
            }
            subTotal = getTotal(items);
            totalDiscount = getTotalDiscount(items);
            $("#totalDiscount").val(totalDiscount);
            $("#subTotal").val(subTotal);

            // calculate total with discuont and transport cost
            let deliveryCharge = isNaN(parseFloat($("#transportCost").val())) ? 0 : parseFloat($("#transportCost").val());
            let total = subTotal;
            total = total + deliveryCharge;
            $("#total").val(total);
        });

    });

    // calculate final amount
    $(document).ready(function(){
        $("#totalDiscount, #transportCost").on("change", function () {
            let subTotal = isNaN(parseFloat($("#subTotal").val())) ? 0 : parseFloat($("#subTotal").val());
            let deliveryCharge = isNaN(parseFloat($("#transportCost").val())) ? 0 : parseFloat($("#transportCost").val());
            let total = subTotal + deliveryCharge;
            $("#total").val(total)
        });
    });
})();


// Initialize select2
function initSelect2(){

    $(".select2bs4_el").select2({
        theme: 'bootstrap4',
    });
}
