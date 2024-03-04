<<<<<<< HEAD
=======
// $('.re_star a').click(function(){
//     $(this).parent().children('a').removeClass('on');
//     $(this).addClass('on').prevAll('a').addClass('on');
//     return false;
//   });
>>>>>>> origin/feature/pay_sy

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

<<<<<<< HEAD
// 리뷰 수정 페이지 제목 글자 수 출력하는 코드
$('#re_titleContent').keyup(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount1').text('0');
    } else{
        $('#re_nowTextCount1').text(content.length);
    }
})

// 리뷰 수정 페이지 상세리뷰 글자 수 출력하는 코드
=======
// 별점 Jquery로 DB에 넘기는 코드
{/* <script>
$(document).ready(function() {
  // 별 클릭 이벤트 처리
  $(".starR").click(function() {
    // 선택된 별의 data-value 값 가져오기
    var starValue = $(this).data("value");

    // 선택된 별만 'on' 클래스 추가
    $(".starR").removeClass("on");
    $(this).addClass("on");

    // 별점 값을 서버로 전송 (예: Ajax 사용)
    $.ajax({
      url: "/review/rating",
      method: "POST",
      data: {
        starRating: starValue
      },
      success: function(response) {
        // 성공 처리
      },
      error: function(error) {
        // 실패 처리
      }
    });
  });
});
</script> */}




// 리뷰 수정 페이지 글자 수 출력하는 코드
>>>>>>> origin/feature/pay_sy
$('#re_detailReviewContent').keyup(function (e) {
   let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
<<<<<<< HEAD
        $('#re_nowTextCount2').text('0');
    } else{
        $('#re_nowTextCount2').text(content.length);
    }
}) 


// 리뷰 작성 페이지 제목 글자 수 출력하는 코드
$('#re_inputTitle').keyup(function (e) {
	let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
        $('#re_nowTextCount1').text('0');
    } else{
        $('#re_nowTextCount1').text(content.length);
    }
}) 

// 리뷰 작성 페이지 상세리뷰 글자 수 출력하는 코드
=======
        $('#re_nowTextCount').text('0');
    } else{
        $('#re_nowTextCount').text(content.length);
    }
}) 

// 리뷰 작성 페이지 글자 수 출력하는 코드
>>>>>>> origin/feature/pay_sy
$('#re_detailReview').keyup(function (e) {
   let content = $(this).val();
    // console.log(content);
    if(content.length == 0 || content == ''){
<<<<<<< HEAD
        $('#re_nowTextCount2').text('0');
    } else{
        $('#re_nowTextCount2').text(content.length);
    }
}) 


=======
        $('#re_nowTextCount').text('0');
    } else{
        $('#re_nowTextCount').text(content.length);
    }
}) 

>>>>>>> origin/feature/pay_sy
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

