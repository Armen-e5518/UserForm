function SetMaxCharacter() {

    $('.demo #max-character').each(function () {
        $(this).closest('.box-element').find('.view input').attr('max-character', $(this).val())
        $(this).closest('.box-element').find('.view textarea').attr('max-character', $(this).val())
    })

}