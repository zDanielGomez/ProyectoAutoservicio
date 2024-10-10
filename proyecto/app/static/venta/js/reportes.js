var fecha = null;
var fechaactual =new moment().format('DD-MM-YYYY');
var fechain =new moment().format('YYYY-MM-DD');
function generar_reporte(){
    var parametros ={
        'action' : 'buscar_reporte',
        'fecha1' : fechain,
        'fecha2' : fechain
    };

    if (fecha !==null ){
        parametros['fecha1'] = fecha.startDate.format('YYYY-MM-DD')
        parametros['fecha2'] = fecha.endDate.format('YYYY-MM-DD')
    }
    if ($.fn.DataTable.isDataTable('#tabla')) {
        $('#tabla').DataTable().destroy(); 
    }
    $('#tabla').DataTable({
        responsive: false,
        lengthChange: false,
        autoWidth: false,
        language: {
            url: "{% static 'lib/datatables-1.10.20/español.json' %}",
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
            data: parametros,
            dataSrc: ""
        },
        order:false,
        
        columnDefs: [
            {
                targets: [-1],
                class: 'text-center',
                orderable: false,
                render: function (data, type, row) {
                    return '$'+parseFloat(data).toFixed(2);
                }
            },
        ],
        initComplete: function (settings, json) {

        }
    });
}
$(function (){
    $('input[name="date_range"]').daterangepicker()
    .on('apply.daterangepicker', function(ev, picker) {
        fecha=(picker)
        generar_reporte();
    }).on('cancel.daterangepicker', function(ev, picker) {
        $(this).data('daterangepicker').setStartDate(fechaactual);
        $(this).data('daterangepicker').setEndDate(fechaactual);
        generar_reporte();
    });

    generar_reporte();
});