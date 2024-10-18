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
                        text: 'Venta agregada correctamente',
                        icon: 'success',
                        timer: 2000
                    }).then((result) => {
                        callback(data);
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
var tblSale;
var tablaproductos;
var vents = {
    items: {
        cliente: '',
        fecha_venta: '',
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
    calcular_factura: function(){
        var subtotal = 0.00;
        $.each(this.items.products, function(pos,dict){
            dict.subtotal = dict.cant * parseFloat(dict.precio);
            console.log(dict.subtotal)
            subtotal+=dict.subtotal;
        })
        this.items.subtotal = subtotal;
        console.log(subtotal);
        $('input[name="total_venta"]').val(this.items.subtotal.toFixed(2))

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
                        return '$' + parseFloat(data).toFixed(2);
                    }
                },
                {
                    targets: [-2],
                    class: 'text-center',
                    orderable: false,
                    render: function (data, type, row) {
                        return '<input type="number" min="0" name="cant" class="form-control form-control-sm input-sm" autocomplete="off" value="'+row.cant+'">';
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
            rowCallback(row, data, displayNum, displayIndex, dataIndex) {

                $(row).find('input[name="cant"]').TouchSpin({
                    min: 1,
                    max: data.cantidad,
                    step: 1
                });

            },
            initComplete: function (settings, json) {

            }
        });
        console.log(this.items);
        console.log("idsss");
        console.log(this.get_ids());
    },
};

$(function () {
    $('.select2').select2({
        theme: "bootstrap4",
        language: 'es'
    });
    
    $('.btnDV').on('click', function(){
        alert("www");
    });
    $('input[name="search"]').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: window.location.pathname,
                type: 'POST',
                data: {
                    'action': 'search_products',
                    'term': request.term,
                    'ids': JSON.stringify(vents.get_ids())
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
            console.log(vents.items);
            vents.items.products.push(ui.item);
            vents.list();
            $(this).val("");
        }
    });
    
    $('.btneliminartodo').on('click', function(){
        if (vents.items.products.length===0){
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
            vents.items.products.splice(tr.row,1);
            vents.list();
            Swal.fire({
                title: '¡Éxito!',
                text: 'Se elimino el producto correctamente.',
                icon: 'success',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#3085d6',
                timer: 1000
            })
            vents.list();
            }
        })

            
        }  )
        .on('change', 'input[name="cant"]', function() {
            console.clear();
            
            var cant = parseInt($(this).val());
            var tr = tablaproductos.cell($(this).closest('td, li')).index();
            var data = tablaproductos.row(tr.row).data(); // Cambiar aquí para obtener los datos de la fila
            console.log("----")
            console.log(data)
    
            if (cant > data.cantidad) {
                Swal.fire({
                    title: 'Error!',
                    text: 'No se puede agregar '+ cant +'. La cantidad máxima disponible es ' + data.cantidad,
                    icon: 'warning',
                    confirmButtonText: 'Aceptar',
                    confirmButtonColor: '#be3b25',
                });
                $(this).val(data.cantidad);
                cant = data.cantidad;
            }
            else if (cant<=0){
                Swal.fire({
                    title: 'Error!',
                    text: 'No puedes dejar '+cant+' en la cantidad del producto '+ data.nombre+' tienes que ingresar un numero positivo',
                    icon: 'warning',
                    confirmButtonText: 'Aceptar',
                    confirmButtonColor: '#be3b25',
                });
            } else if (isNaN(cant) ) {
                Swal.fire({
                    title: 'Error!',
                    text: 'La cantidad del producto '+data.nombre+' no puede estar vacía.',
                    icon: 'warning',
                    confirmButtonText: 'Aceptar',
                    confirmButtonColor: '#be3b25',
                });
                $(this).val(1);
                return;
            }
    
            vents.items.products[tr.row].cant = cant;
            vents.calcular_factura();
            $('td:eq(5)', tablaproductos.row(tr.row).node()).html('$' + vents.items.products[tr.row].subtotal.toFixed(2));
        });
    //     .on('change', 'input[name="cant"]', function(){
    //     console.clear();
    //     var cant = parseInt($(this).val());
    //     var tr = tablaproductos.cell($(this).closest('td, li')).index();
    //     var data = tablaproductos.row(tr.row).node();
    //     console.log(data);
    //     vents.items.products[tr.row].cant = cant;
    //     console.log(vents.items.products)
    //     vents.calcular_factura();
    //     $('td:eq(5)',tablaproductos.row(tr.row).node()).html('$'+ vents.items.products[tr.row].subtotal.toFixed(2));

    // });

    $('form').on('submit', function (e) {
        e.preventDefault();
        console.log(vents.items)

        var isValid = true; // Suponemos que es válido
        $('#tablaproductos tbody input[type="number"]').each(function() {
            if ($(this).val() === '') {
                isValid = false; 
                return false; 
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
            return false; 
        }

        if(vents.items.products.length === 0){
            Swal.fire({
                title: 'Error!',
                text: 'No tienes productos agregados',
                icon: 'success warning',
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '#be3b25',
                timer: 2000 
            });
            return false;
        }
        
        vents.items.fecha_venta = $('input[name="fecha_venta"]').val();
        vents.items.cliente = $('select[name="cliente"]').val();
        var parameters = new FormData();
        parameters.append('action', $('input[name="action"]').val());
        parameters.append('vents', JSON.stringify(vents.items));
        submit_with_ajax(window.location.pathname, 'Notificación', '¿Estas seguro de realizar la siguiente acción?', parameters, function (respuesta) {
            console.log(respuesta);
            Swal.fire({
                title: '¿Deseas imprimir la factura?',
                
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'No',
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                }).then((result) => {
                if (result.isConfirmed) {
                    window.open('/app/venta/factura/' + respuesta.id + '/', '_blank');
                    //para evitar que se quede en la factura
                    location.href = '/app/venta/listar/';
                } else {
                    location.href = '/app/venta/listar/';
                }
            });
            
        });
    });
});


