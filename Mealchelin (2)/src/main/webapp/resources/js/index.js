/* 헤더 네비게이션 스크롤시 변경*/
$(window).on('scroll',function(){
    if($(window).scrollTop()){
        $('#header').addClass('active');
    }else{
        $('#header').removeClass('active');
    }
});

$(document).on('ready', function(){

    /* 메인 배너 슬라이드*/
    $('.banner-slide').slick({
        dots: true,
        arrows:true,
        slidesToShow: 1,
        autoplay:true,
        autoplaySpeed: 3200,
        infinite:true,
        arrows: false
    });

    /*색션 2 슬라이드*/
    $('.pick_list').slick({
        infinite: true,
        prevArrow: $('#prev1'),
        nextArrow: $('#next1'),
        dots:false,
        slidesToShow: 3,
        slidesToScroll: 3
    });

    /*색션 5 슬라이드*/
    $('.main_review_list').slick({
        infinite: true,
        prevArrow: $('#prev2'),
        nextArrow: $('#next2'),
        dots:false,
        slidesToShow: 3,
        slidesToScroll: 3
    });

});


/*top 버튼 js*/
let topBtn = document.getElementById('topBtn');

const scrollWindow = function () {  
    if (window.scrollY != 0) {
        setTimeout(function () {
        window.scrollTo(0, window.scrollY - 50);
        scrollWindow();
        }, 10);
    }
};

topBtn.addEventListener('click', scrollWindow);
