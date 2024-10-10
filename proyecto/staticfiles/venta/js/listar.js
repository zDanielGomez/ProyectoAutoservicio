var tblSale;
$(function () {
    tblSale = $('#data').DataTable({
        responsive: false,
        lengthChange: false,
        autoWidth: false,
        language: {
            url:"//cdn.datatables.net/plug-ins/1.13.5/i18n/es-ES.json",
        },
        buttons: [
            { extend: 'copy', text: 'Copiar tabla', className: 'custom-button', exportOptions: { columns: ':not(:last-child)' } },
            { extend: 'excel', text: 'Archivo Excel', className: 'custom-button', exportOptions: { columns: ':not(:last-child)' } },
            { extend: 'pdf', text: 'PDF', className: 'custom-button', exportOptions: { columns: ':not(:last-child)' } },
            { extend: 'print', text: 'Imprimir', className: 'custom-button', exportOptions: { columns: ':not(:last-child)' } }
        ],
        dom: 'Bfrtip',
        ajax: {
            url: window.location.pathname,
            type: 'POST',
            data: {
                'action': 'searchdata'
            },
            dataSrc: ""
        },
        columns: [
            {"data": "id"},
            {"data": "fecha_venta"},
            {"data": "cc_cliente"},
            {"data": "cliente"},
            {"data": "empleado"},
            {"data": "id"},
            {"data": "total_venta"},
            {"data": "id"},
        ],
        columnDefs: [
            {
                targets: [-3],
                class: 'text-center',
                orderable: false,
                render: function (data, type, row) {
                    var buttons =  '<a rel="detalle" + class="btn btn-success btn-xs btn-flat"><i class="fas fa-search"></i></a> ';
                    return buttons;
                }
            },
            {
                targets: [-2],
                class: 'text-center',
                orderable: false,
                render: function (data, type, row) {
                    return '$' + parseFloat(data).toFixed(2);
                }
            },
            {
                targets: [-1],
                class: 'text-center',
                orderable: false,
                render: function (data, type, row) {
                    var buttons = '<a href="/app/venta/eliminar/' + row.id + '/" class="btn btn-danger btn-xs btn-flat"><i class="fas fa-trash-alt"></i></a> ';
                    buttons += '<a href="/app/venta/editar/' + row.id + '/" class="btn btn-warning btn-xs btn-flat"><i class="fas fa-edit"></i></a> ';                    return buttons;
                }
            },
        ],
        initComplete: function (settings, json) {

        }
    });

    $('#data tbody')
        .on('click', 'a[rel="detalle"]', function () {
            var tr = tblSale.cell($(this).closest('td, li')).index();
            var data = tblSale.row(tr.row).data();
            console.log(data);

            $('#tablaDet').DataTable({
                responsive: true,
                autoWidth: false,
                destroy: true,
                deferRender: true,
                ajax: {
                    url: window.location.pathname,
                    type: 'POST',
                    data: {
                        'action': 'search_details_prod',
                        'id': data.id
                    },
                    dataSrc: "",
                },
                columns: [
                    {"data": "id_producto.nombre"},
                    {"data": "id_producto.categoria.nombre"},
                    {"data": "precio"},
                    {"data": "cantidad"},
                    {"data": "subtotal"},
                ],
                columnDefs: [
                    {
                        targets: [-1,-3],
                        class: 'text-center',
                        orderable: false,
                        render: function (data, type, row) {
                            return '$' + parseFloat(data).toFixed(2);
                        }
                    },
                    {
                        targets: [-2],
                        class: 'text-center',
                        render: function (data, type, row) {
                            return data;
                        }
                    },
                ],
                initComplete: function (settings, json) {
        
                }
            });
            
            
            $('#ModeloDet').modal('show');  
        });   
});