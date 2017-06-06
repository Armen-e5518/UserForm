$(document).ready(function () {
    $('body').click(function () {
        CheckNotEmptyAndEmailVal(false)
    })
    $('#save-data').click(function () {
        if (CheckNotEmptyAndEmailVal(true)) {
            $('#data-form').submit();
        }
    })
});

function CheckNotEmptyAndEmailVal(scroll_flag) {
    var flag = true;
    $('.not-empty').each(function () {
        var val = $(this).val();
        if (!val) {
            flag = false;
            $(this).addClass('empty-active');
            $(this).closest('.view').find('.error-pop').remove()
            $(this).after('<span class="error-pop">Required field...</span>')
            if (scroll_flag) {
                $('body').scrollTop($(this).offset().top - 80);
            }
            // return flag;
        } else {
            $(this).removeClass('empty-active')
            $(this).closest('.view').find('.error-pop').remove()
        }
    });

    $('#user-view input[type="email"]').each(function () {
        if (!validateEmail($(this).val())) {
            flag = false;
            $(this).addClass('empty-active')
            $(this).closest('.view').find('.error-pop').remove()
            $(this).after('<span class="error-pop">Incorrect email address...</span>')
            if (scroll_flag) {
                $('body').scrollTop($(this).offset().top - 80);
            }
            // return flag;
        } else {
            $(this).removeClass('empty-active')
            $(this).closest('.view').find('.error-pop').remove()
        }
    })
    return flag;
}


function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}