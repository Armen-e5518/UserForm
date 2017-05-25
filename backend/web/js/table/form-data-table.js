$(document).ready(function () {

    var table = $('#form-data-table').DataTable({
        "pageLength": 10,
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel', 'pdf'
        ],

    });
 
    $('#form-data-table thead th').each(function () {
        $(this).append('<input type="text" placeholder="Search" />');
    });

    table.columns().every(function () {
        var that = this;

        $('input', this.header()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                    .search(this.value)
                    .draw();
            }
        });
    });


});