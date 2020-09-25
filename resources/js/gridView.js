jQuery(document).ready(function ($) {
    $( ".__delete" ).click(function(e) {
        e.preventDefault();
        let id = $(this).attr('data-id');
        let url = $(this).attr('data-url');

        console.log(id);
        console.log(url);

        $.ajax({
            url: url,
            type: 'POST',
            data: {
                id: id
            },
            success: function () {
                window.location.reload();
            },
            error: function (res) {
                console.log(res)
            }
        });
    });

    $(".__filter").on("focusout", function (e) {
        $(".__filterForm").submit();
    });

    $(".__filter").on('keypress',function(e) {
        if(e.which == 13) {
            $(".__filterForm").submit();
        }
    });
});
