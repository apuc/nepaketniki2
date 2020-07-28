$(document).ready(function() {
    $('#submit').on('click', function (e) {
        e.preventDefault();
        const URL = window.location.href;
        const URL_Info = URL.split('/');
        const tourId = URL_Info[URL_Info.length-1];
        $.ajax({
            url:      '/tour/reserve/' + tourId,
            type:     'POST',
            data: $("#request-form").serialize(),
            beforeSend: function() {
                $('#submit').prop('disabled', true);
            },
            success: function(response) {
                console.log(response);
                if (response.length !== 0) {
                    const result = $.parseJSON(response);
                    console.log(result);
                    if (result.hasOwnProperty('name')) {
                        $('#nameMessage').html(result.name);
                    }
                    if (result.hasOwnProperty('phone')) {
                        $('#phoneMessage').html(result.phone);
                    }
                    if (result.hasOwnProperty('email')) {
                        $('#emailMessage').html(result.email);
                    }
                    $('#submit').prop('disabled', false);
                }
                else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Место успешно забронировано',
                        showConfirmButton: false,
                        timer: 1700
                    });
                    $('#phone').val('');
                    $('#name').val('');
                    $('#email').val('');
                    $('#submit').prop('disabled', true);
                }
            },
        });
        return false;
    });
});