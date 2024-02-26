// $('.re_star a').click(function(){
//     $(this).parent().children('a').removeClass('on');
//     $(this).addClass('on').prevAll('a').addClass('on');
//     return false;
//   });

// 별점 주는 코드
$('.re_star > .starR').click(function() {
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
})

// 별점의 data-value를 가져오는 코드
$('.starR').click(function() {
    let selectedValue = 0;
    selectedValue = $(this).data('value');
    console.log(selectedValue);
});

// 리뷰 수정 페이지 글자 수 출력하는 코드
$('#re_detailReviewContent').keyup(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount').text('0');
    } else{
        $('#re_nowTextCount').text(content.length);
    }
}) 

// 리뷰 작성 페이지 글자 수 출력하는 코드
$('#re_detailReview').keyup(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount').text('0');
    } else{
        $('#re_nowTextCount').text(content.length);
    }
}) 

// 첨부 파일 선택시 사진 첨부 버튼 옆에 첨부 파일명 기재되게 하는 코드.
$('#re_imgadd').change(function() {
    $('#re_imgSizeMsg').empty();
    let imgName = this.files[0].name

    $('#re_imgSizeMsg').css({
        'font-size': '16px',
        'color': '#000000'
    });

    $('#re_imgSizeMsg').html(imgName);
})


// 기간 설정하면 해당 value 콘솔에 찍는 코드. 추후에 해당 value값 db에 넘겨줘서 조건에 맞는 것들 나오게끔 하면 될듯?
$('#re_periodDropBox').change(function(){
    let period = $('#re_periodDropBox').val()

    console.log(period);
});