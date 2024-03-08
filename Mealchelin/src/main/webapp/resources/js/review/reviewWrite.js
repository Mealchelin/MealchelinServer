
// 별점 주는 코드
$('.re_star > .starR').click(function() {
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
})

// 별점의 data-value를 가져오는 코드
$('.starR').click(function() {
    let selectedValue = 0;
    selectedValue = $(this).data('value');
    
    $('#ratedInput').val(selectedValue);
    console.log($('#ratedInput').val());

});

// 리뷰 수정 페이지 제목 글자 수 출력하는 코드
$('#re_titleContent').keydown(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount1').text('0');
    } else{
        if(content.length > 30){
            $('#re_nowTextCount1').text('30');
        } else{
            $('#re_nowTextCount1').text(content.length);
        }
    }
})

// 리뷰 수정 페이지 상세리뷰 글자 수 출력하는 코드
$('#re_detailReviewContent').keydown(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount2').text('0');
    } else{
        if(content.length > 300){
            $('#re_nowTextCount2').text('300');
        } else{
            $('#re_nowTextCount2').text(content.length);
        }
    }
}) 


// 리뷰 작성 페이지 제목 글자 수 출력하는 코드
$('#re_inputTitle').keydown(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount1').text('0');
    } else{
        if(content.length > 30){
            $('#re_nowTextCount1').text('30');
        } else{
            $('#re_nowTextCount1').text(content.length);
        }
    }
}) 

// 리뷰 작성 페이지 상세리뷰 글자 수 출력하는 코드
$('#re_detailReview').keydown(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount2').text('0');
    } else{
        if(content.length > 300){
            $('#re_nowTextCount2').text('300');
        } else{
            $('#re_nowTextCount2').text(content.length);
        }
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


// 작성한 리뷰 삭제하는 코드
 $('.re_deleteBtn').on('click', (event) => {
    let reviewNo = $(event.target).val();
    console.log($(event.target).val());
    if (confirm('게시글을 삭제 하시겠습니까?')) {
        location.replace('/mypage/delete?no=' + reviewNo);
    }
 });

// 작성한 리뷰 상세보기
 $('#editBtn').on('click', () => {
    let reviewNo = $('#deleteBtn').val();

    location.replace('/mypage/edit?no=' + reviewNo);
 });



