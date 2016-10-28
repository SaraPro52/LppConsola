$(document).ready(function () {
    //
    $('.menu li:has(ul)').click(function (e) {
        if ($(this).hasClass('activado')) {
            //  e.preventDefault();
        } else {
            $('.menu li ul').slideUp();
            $('.menu li').removeClass('activado');
            $(this).addClass('activado');
            $(this).children('ul').slideDown();
        }
    });
});


