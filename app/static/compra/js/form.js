function message_error(obj) {
    var html = '';
    if (typeof (obj) === 'object') {
        html = '<ul style="text-align: left;">';
        $.each(obj, function (key, value) {
            html += '<li>' + key + ': ' + value + '</li>';
        });
        html += '</ul>';
    } else {
        html = '<p>' + obj + '</p>';
    }
    Swal.fire({
        title: 'Error!',
        
        icon: 'error'
    });
}

function submit_with_ajax(url, title, content, parameters, callback) {
    Swal.fire({
        title: title,
        text: content,
        icon: 'info',
        showCancelButton: true,
        confirmButtonText: 'Si',
        cancelButtonText: 'No',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: url, //window.location.pathname
                type: 'POST',
                data: parameters,
                dataType: 'json',
                processData: false,
                contentType: false,
            }).done(function (data) {
                console.log(data);
                if (!data.hasOwnProperty('error')) {
                    Swal.fire({
                        title: '¡Éxito!',
                        text: 'Compra agregada correctamente',
                        icon: 'success',
                        confirmButtonText: 'Aceptar',
                        confirmButtonColor: '#3085d6',
                        timer: 1000
                    }).then((result) => {
                        callback();
                    });
                    return false;
                }
                message_error(data.error);
            }).fail(function (jqXHR, textStatus, errorThrown) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: textStatus + ': ' + errorThrown,
                });
            }).always(function (data) {

            });
        }
    });
}

function alert_action(title, content, callback) {
    $.confirm({
        theme: 'material',
        title: title,
        icon: 'fa fa-info',
        content: content,
        columnClass: 'small',
        typeAnimated: true,
        cancelButtonClass: 'btn-primary',
        draggable: true,
        dragWindowBorder: false,
        buttons: {
            info: {
                text: "Si",
                btnClass: 'btn-primary',
                action: function () {
                    callback();
                }
            },
            danger: {
                text: "No",
                btnClass: 'btn-red',
                action: function () {

                }
            },
        }
    })
}
var tblCompra;
var tablaproductos;
var compras = {
    items: {
        proveedor: '',
        fecha_compra: '',
        subtotal: 0.00,
        total: 0.00,
        products: []
    },
    get_ids:function(){
        var ids =[];
        $.each(this.items.products, function (key, value){
            ids.push(value.id)
        });
        return ids;
    },
    get_ids:function(){
        var ids =[];
        $.each(this.items.products, function (key, value){
            ids.push(value.id)
        });
        return ids;
    },
    calcular_factura: function(){
        actualizarDatos
        var subtotal = 0.00;
        $.each(this.items.products, function(pos,dict){
            dict.subtotal = dict.cant * parseFloat(dict.precio);
            console.log(dict.subtotal)
            subtotal+=dict.subtotal;
        })
        this.items.subtotal = subtotal;
        console.log(subtotal);
        $('input[name="total_compra"]').val(this.items.subtotal.toFixed(2))

    },
    
    add: function(item){
        this.items.products.push(item);
        this.list();
    },
    list: function () {
        this.calcular_factura();
        tablaproductos = $('#tablaproductos').DataTable({
            responsive: false,
            autoWidth: false,
            language: {
                url: languageUrl,
            },
            destroy: true,
            data: this.items.products,
            columns: [
                {"data": "id"},
                {"data": "nombre"},
                {"data": "cantidad"},
                {"data": "precio"},
                {"data": "cant"}, 
                {"data": "subtotal"},
            ],
            columnDefs: [
                {
                    targets: [0],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        return '<a rel="remove" class="btn btn-danger btn-xs btn-flat" style="color: white"><i class="fas fa-trash-alt"></i></a>';
                    }
                },
                {
                    targets: [-4],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        if(data > 10){
                            return '<span class= "badge badge-success">'+data+'</span>'
                        }
                        else if( data <=10 ){
                            return '<span class= "badge badge-warning">'+data+'</span>'
                        }
                        else {
                            return '<span class= "badge badge-danger">'+data+'</span>'
                        }
                    }
                },
                {
                    targets: [-3],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        return '<input type="number" min="1"  value="' + parseFloat(data).toFixed(2) + '" name="precio" class="form-control"  oninput="if(this.value < 0) this.value = 0" onchange="actualizarDatos(this, ' + row.id + ')">';
                    }
                },
                {
                    targets: [-2],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        return '<input type="number" min="1" name="cant" class="form-control"  autocomplete="off" value="'+row.cant+'">';
                    }
                },
                {
                    targets: [-1],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        return '$' + parseFloat(data).toFixed(2);
                    }
                },
            ],
            
            initComplete: function (settings, json) {

            }
        });
    },
};
function actualizarDatos(input, id) {
    var nuevaData = parseFloat(input.value);
    var tr = tablaproductos.cell($(input).closest('td, li')).index();
    var data = tablaproductos.row(tr.row).node();
    compras.items.products[tr.row].precio = nuevaData;
    compras.items.products[tr.row].subtotal = nuevaData * compras.items.products[tr.row].cant;
    $('td:eq(5)', tablaproductos.row(tr.row).node()).html('$' + compras.items.products[tr.row].subtotal.toFixed(2));
    compras.list();
    compras.calcular_factura();
}
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
                    'term': request.term,//sirve para ver que escribio en el campo de busqueda
                    'ids': JSON.stringify(compras.get_ids())
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
            event.preventDefault();
            console.clear();
            ui.item.cant = 1;
            ui.item.subtotal = 0.0;
            console.log(compras.items);
            compras.items.products.push(ui.item);
            compras.list();
            $(this).val("");
        }
    });
    
    $('.btneliminartodo').on('click', function(){
        if (compras.items.products.length===0){
            Swal.fire({
                title: 'Error!',
                text: 'No tienes productos agregados',
                icon: 'success warning',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#be3b25',
                timer: 2000 
            });
        }
        else{
            Swal.fire({
            title: "¿Estás seguro?",
            text: "Se eliminarán todos los productos",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, eliminar",
            cancelButtonText: "No, cancelar",
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
        }).then((result) => {
            if (result.isConfirmed) {
            vents.items.products= [];
            Swal.fire({
                title: '¡Éxito!',
                text: 'Se eliminaron los productos correctamente.',
                icon: 'success',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#3085d6',
                timer: 2000
            })
            vents.list();
            }
        });}
        
    });
    $('#tablaproductos tbody')
        .on("click", 'a[rel="remove"]', function(){
        Swal.fire({
            title: "¿Estás seguro?",
            text: "Se eliminara el producto seleccionado",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, eliminar",
            cancelButtonText: "No, cancelar",
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
        }).then((result) => {
            if (result.isConfirmed) {
            var tr = tablaproductos.cell($(this).closest('td, li')).index();
            compras.items.products.splice(tr.row,1);
            compras.list();
            Swal.fire({
                title: '¡Éxito!',
                text: 'Se elimino el producto correctamente.',
                icon: 'success',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#3085d6',
                timer: 1000
            })
            compras.list();
            }
        })

            
        }  )
        .on('change','input[name="precio"]', function(){
            console.log('Evento change detectado');
            console.log($(this).val());

        })
        .on('change', 'input[name="cant"]', function(){
        console.clear();
        
        var cant = parseInt($(this).val());
            var tr = tablaproductos.cell($(this).closest('td, li')).index();
            var data = tablaproductos.row(tr.row).data(); // Cambiar aquí para obtener los datos de la fila
            console.log("----")
            console.log(data)

        if (cant<=0){
            Swal.fire({
                title: 'Error!',
                text: 'No puedes dejar '+cant+' en la cantidad del producto '+ data.nombre +' tienes que ingresar un numero positivo',
                icon: 'warning',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#be3b25',
            });
            $(this).val(1); // Opcional: Establecer un valor por defecto
            return; // Salir de la función
        } else if (isNaN(cant) ) {
            Swal.fire({
                title: 'Error!',
                text: 'La cantidad del producto '+data.nombre+' no puede estar vacía.',
                icon: 'warning',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#be3b25',
            });
            $(this).val(1); // Opcional: Establecer un valor por defecto
            return; // Salir de la función
        }
        compras.items.products[tr.row].cant = cant;
        console.log(compras.items.products)
        compras.calcular_factura();
        $('td:eq(5)',tablaproductos.row(tr.row).node()).html('$'+ compras.items.products[tr.row].subtotal.toFixed(2));

    });

    $('form').on('submit', function (e) {
        e.preventDefault();

        var isValid = true; // Suponemos que es válido
        $('#tablaproductos tbody input[type="number"]').each(function() {
            if ($(this).val() === '') {
                isValid = false; // Encontramos un campo vacío
                return false; // Salir del bucle each
            }
        });
    
        if (!isValid) {
            Swal.fire({
                title: 'Error!',
                text: 'Todos los campos de precio deben estar llenos.',
                icon: 'warning',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#be3b25',
            });
            return false; // Evita el envío del formulario
        }

        if(compras.items.products.length === 0){
            message_error('Debe al menos tener un item en su detalle de venta');
            return false;
        }
        
        compras.items.fecha_compra = $('input[name="fecha_compra"]').val();
        compras.items.proveedor = $('select[name="proveedor"]').val();
        var parameters = new FormData();
        parameters.append('action', $('input[name="action"]').val());
        parameters.append('compras', JSON.stringify(compras.items));
        submit_with_ajax(window.location.pathname, 'Notificación', '¿Estas seguro de realizar la siguiente acción?', parameters, function () {
            location.href = '/app/compra/listar/';
        });
    });
    
});