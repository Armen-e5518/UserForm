function SavePdfContentFile(content) {
    var data = {};
    data.id = _Id;
    data.form_id = _Form_id;
    data.content = content;
    $.ajax({
        type: "POST",
        url: "/admin/ajax/save-pdf-content",
        data: data,
        success: function (res) {

        }
    })
}