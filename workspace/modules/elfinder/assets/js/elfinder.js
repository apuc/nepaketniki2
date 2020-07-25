$(function () {
    $('#elfinder').elfinder(
        // 1st Arg - options
        {
            // Disable CSS auto loading
            cssAutoLoad: false,

            // Base URL to css/*, js/*
            baseUrl: './',

            // Connector URL
            url: '/finder-connector',

            // Callback when a file is double-clicked
            getFileCallback: function (file) {
                // ...
            },
        },
    );

    $('._select_file').on('click', function(e) {
        var name = $(this).data('name');
        var fm = $('<div/>').dialogelfinder({
            url: '/finder-connector',
            width : 840,
            destroyOnClose : true,
            getFileCallback : function(files, fm) {
                $('#file_' + name).val(files.path);
                console.log(files);
            },
            commandsOptions : {
                getfile : {
                    oncomplete : 'close',
                    folders : true
                }
            }
        }).dialogelfinder('instance');
    });
});