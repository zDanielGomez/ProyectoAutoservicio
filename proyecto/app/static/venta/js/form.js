var vents = {
    items: {
        cliente: '',
        fecha_venta: '',
        empleado: "",
        total: 0.00,
        products: []
    },
    add: function(item){
        this.items.products.push(item);
        this.list();
    },
};

$(function () {
    $('.select2').select2({
        theme: "bootstrap4",
        language: 'es'
    });

    $('input[name="search"]').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: window.location.pathname,
                type: 'POST',
                data: {
                    'action': 'search_products',
                    'term': request.term
                },
                dataType: 'json',
            }).done(function (data) {
                response(data);
            }).fail(function (jqXHR, textStatus, errorThrown) {
                
            }).always(function (data) {

            });
        },
        delay: 300,
        select: function (event, ui) {
            console.log(ui.item)
        }
    });

});