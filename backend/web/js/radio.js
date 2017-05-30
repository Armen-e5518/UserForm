function StopDrag() {
    $('.demo input.gen-redio').each(function (index) {
        $(this).attr('value', index + 1)
    })
}