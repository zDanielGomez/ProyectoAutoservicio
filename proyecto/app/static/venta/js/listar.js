var tblSale;
var rutaJson = "app/static/venta/js/Spanish.json";
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
            {"data": "total_venta"},
            {"data": "id"},
        ],
        columnDefs: [
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
                    //var buttons = '<a href="/erp/sale/update/' + row.id + '/" class="btn btn-warning btn-xs btn-flat"><i class="fas fa-edit"></i></a> ';
                    return buttons;
                }
            },
        ],
        initComplete: function (settings, json) {

        }
    });
});