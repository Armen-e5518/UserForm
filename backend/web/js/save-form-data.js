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
    $('#user-view .not-empty').each(function () {
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
    });

    $('#user-view .gen-name').each(function () {
        var max_character = $(this).attr('max-character')
        if (max_character) {
            if ($(this).val().length * 1 > max_character * 1) {
                flag = false;
                $(this).addClass('empty-active')
                $(this).closest('.view').find('.error-pop').remove()
                $(this).after('<span class="error-pop">Text should contain at most ' + max_character + ' characters...</span>')
                if (scroll_flag) {
                    $('body').scrollTop($(this).offset().top - 80);
                }
            } else {
                $(this).removeClass('empty-active')
                $(this).closest('.view').find('.error-pop').remove()
            }
        }
    });

    var Rad_names = [];
    var Rad_name = '';
    $('#user-view .checked-required').each(function () {
        if (Rad_name != $(this).attr('name-required')) {
            Rad_names.push($(this).attr('name-required'));
            Rad_name = $(this).attr('name-required');
        }
    });
    if (Rad_names) {
        Rad_names.forEach(function (val, index) {
            var rad_flag = false;
            $('#user-view .checked-required[name-required="' + val + '"]').each(function () {
                if ($(this).is(':checked')) {
                    rad_flag = true;
                }
            });
            if (!rad_flag) {
                flag = false;
                $('#user-view .checked-required[name-required="' + val + '"]').closest('div').find('.name-title').addClass('radio-active')
            } else {
                $('#user-view .checked-required[name-required="' + val + '"]').closest('div').find('.name-title').removeClass('radio-active')
            }
        })
    }
    return flag;
}


function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

// 408354113
// 6565