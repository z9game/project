$(document).ready(function() {
    $('.header').on('mouseover', function() {
        $('.headerNav .navInner').stop(true, true).slideDown(300); // 모든 .navInner를 엽니다.
    });

    $('.header').on('mouseleave', function() {
        $('.headerNav .navInner').stop(true, true).slideUp(300); // 모든 .navInner를 닫습니다.
    });
});
