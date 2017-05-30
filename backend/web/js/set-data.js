$(document).ready(function () {
    if (_Id && _Form_id) {
        var data = {};
        data.id = _Id;
        data.form_id = _Form_id;
        $.ajax({
            type: "POST",
            url: "/admin/ajax/get-form-data-by-id",
            data: data,
            success: function (res) {
                if (res) {
                    SetHtmlData(res)
                } else {
                    $('.content-user-data').html('');
                    $('.content-user-data').html('<h1>No data</h1>');
                }
            }
        })
    } else {
        $('.content-user-data').html('');
        $('.content-user-data').html('<h1>No data</h1>');
    }
});

function SetHtmlData(data) {
    var val = $.map(data, function (el) {
        return (el == null) ? 0 : el;
    });
    var index = $.map(data, function (el, i) {
        return i
    });
    out(val);
    out(index);
    $.each(index, function (index, value) {
        var form_name = value;
        var form_value = val[index];

        if (form_name.indexOf('textarea') >= 0
            || form_name.indexOf('text') >= 0
            || form_name.indexOf('table') >= 0
            || form_name.indexOf('user') >= 0
        ) {
            $('[name="' + form_name + '"]').val(form_value)
        } else if (form_name.indexOf('checkbox') >= 0) {
            if (form_value == 'on') {
                $('[name="' + form_name + '"]').prop('checked', true)
            }
        } else if (form_name.indexOf('radio') >= 0) {
            if (form_value) {
                $('#user-view input.gen-redio[value="' + form_value + '"]').prop('checked', true);
                $('#pdf-content input.gen-redio[value="' + form_value + '"]').attr('name', NameGenerator('pdf'));
                $('#pdf-content input.gen-redio[value="' + form_value + '"]').prop('checked', true);
            }
        } else if (form_name.indexOf('select') >= 0) {
            $('[name="' + form_name + '"]').val(form_value)
        } else if (form_name.indexOf('file') >= 0) {
            if (form_value) {
                var href = location.protocol + "//" + document.domain + '/admin/uploads/' + form_value;
                $('[name="' + form_name + '"]').parent().html('<a href="' + href + '" download>Download File</a>')
                $('[name="' + form_name + '"]').remove();
            }
            $('[name="' + form_name + '"]').parent().html('<a>No File</a>')
            $('[name="' + form_name + '"]').remove();
        }
        InactiveAllElements()
    });
    SavePdfContent()
}
function SavePdfContent() {
    $('#pdf-content .drag').remove();
    $('#pdf-content .configuration').remove();
    $('#pdf-content .remove').remove();
    $('#pdf-content .preview').remove();
    $('#pdf-content .edit-text').remove();

    $('#pdf-content .column').each(function () {
        if ($(this).hasClass('col-md-4')) {
            SetDivPos($(this), '25%')
        }
        if ($(this).hasClass('col-md-2')) {
            SetDivPos($(this), '10%')
        }
        if ($(this).hasClass('col-md-3')) {
            SetDivPos($(this), '30%')
        }
        if ($(this).hasClass('col-md-8')) {
            SetDivPos($(this), '60%')
        }
        if ($(this).hasClass('col-md-6')) {
            SetDivPos($(this), '40%')
        }
    });
    $('#pdf-content input').each(function () {
        var type = $(this).attr('type');
        if (type == 'text' || type == 'email' || type == 'number' || type == 'tel') {
            $(this).after('<span>' + $(this).val() + '</span>');
            $(this).remove();
        }
        if (type == 'radio') {
            if ($(this).is(':checked')) {
                $(this).after('<span><img src="/admin/images/form-img/active-radio.png" width="15px" alt=""></span>');
                $(this).remove();
            } else {
                $(this).after('<span><img src="/admin/images/form-img/empty-radio.png" width="15px" alt=""></span>');
                $(this).remove();
            }
        }
        if (type == 'checkbox') {
            if ($(this).is(':checked')) {
                $(this).after('<span><img src="/admin/images/form-img/active-che.png" width="15px" alt=""></span>');
                $(this).remove();
            } else {
                $(this).after('<span><img src="/admin/images/form-img/empty-che.png" width="15px" alt=""></span>');
                $(this).remove();
            }
        }
        $('#pdf-content select').each(function () {
            $(this).after('<span>' + $(this).val() + '</span>');
            $(this).remove();
        })
    })
    $('#pdf-content textarea').each(function () {
        $(this).after('<span>' + $(this).val() + '</span>');
        $(this).remove();
    })
    var content = $('#pdf-content').html();
    SavePdfContentFile(content)
}

function InactiveAllElements() {
    $('#user-view input').attr('disabled', true);
    $('#user-view textarea').attr('disabled', true);
    $('#user-view select').attr('disabled', true);
}

function SetDivPos(ob, proc) {
    ob.css('display', 'block')
    ob.css('float', 'left')
    ob.css('width', proc)
    ob.css('padding-top', '10px')
    ob.css('padding-bottom', '10px')
}