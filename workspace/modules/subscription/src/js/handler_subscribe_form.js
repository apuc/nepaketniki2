$(document).ready(function() {
    $('#submit').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            url:      '/subscribe',
            type:     'POST',
            data: $("#request-form").serialize(),
            beforeSend: function() {
                $('#submit').prop('disabled', true);
            },
            success: function(response) {
                if (response.length !== 0) {
                    const result = $.parseJSON(response);

                    if (result.hasOwnProperty('name')) {
                        $('#nameMessage').html(result.name);
                    }
                    if (result.hasOwnProperty('phone')) {
                        $('#phoneMessage').html(result.phone);
                    }
                    $('#submit').prop('disabled', false);
                } else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Подписка успешно оформлена',
                        showConfirmButton: false,
                        timer: 1700
                    });
                    $('#phone').val('');
                    $('#name').val('');
                    $('#nameMessage').html('');
                    $('#phoneMessage').html('');
                    $('#submit').prop('disabled', true);
                }
            },
        });
        return false;
    });
});