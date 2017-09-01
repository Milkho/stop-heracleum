$(function () {

    $('#slide-submenu').on('click', function () {
        $(this).closest('.my-sidebar').fadeOut('slide', function () {
            $('.mini-submenu').fadeIn();
        });

    });

    $('.mini-submenu').on('click', function () {
        $(this).next('.my-sidebar').toggle('slide');
        $('.mini-submenu').hide();
    })
})
