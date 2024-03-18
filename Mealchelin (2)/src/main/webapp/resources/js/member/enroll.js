$(document).ready(()=>{

// 아이디 체크 
    $('#memID').keyup(function(){
        let id = $('#memID').val();
        let regex = /^[a-zA-Z0-9]{6,16}$/;
    
        if(regex.exec(id)){
            $('#memregId').html("사용 가능한 아이디 입니다");            
        } else{
            $('#memregId').html("6자 이상 16자 이하 영문/숫자 조합");
        }

    });
    

// 비밀번호 정규식 체크 
    $('#memPwd').keyup(function(){
        let pwd = $('#memPwd').val();
        let regex = /^(?=.*[A-Za-z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,25}$/;
        
        if(regex.exec(pwd)){
            $('#memregPwd').html("사용 가능한 비밀번호 입니다.");
           
        }else {
            $('#memregPwd').html("6자 이상 25자 이하 영문/숫자/특수문자 조합");
              
        }
    });
    
	 
	 $('.memEnroll').on('click', ()=>{
	 	let pwd = $('#memPwd').val();
        let regex = /^(?=.*[A-Za-z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,25}$/;
 	        
		let memchecker1 = $('#memchecker1').is(':checked');
		let memchecker2 = $('#memchecker2').is(':checked');
		let memchecker3 = $('#memchecker3').is(':checked');

         
         if(!regex.exec(pwd)){
				alert ("패스워드가 형식에 맞지 않습니다.");
				   
         } else if( !memchecker1 || !memchecker2 || !memchecker3 ){         	
         		alert ("이용약관 필수 항목에 체크해주세요.");
				
         } else {
         	
          		$('.memEnroll').prop('type', "submit");
         
         
         }
             
         
         
         
        
	 });
	 
        
// 비밀번호 같은 번호를 입력했는지 체크 
    $('#memPwd2').keyup(function(){
        let pwd = $('#memPwd').val();
        let pwd2 = $('#memPwd2').val();

        if(pwd === pwd2){
            $('#memregPwd2').html("동일한 비밀번호 입니다.");
        } else {
            $('#memregPwd2').html("동일 하지 않은 비밀번호입니다.");

        }

    });
    


 

//  모달창 
    $('.memview1').on('click',()=>{
        $('.memmodalbox1').fadeIn();
        $('.memmodal_bg').fadeIn();
    });

    $('.memmodal_btn1').on('click',()=>{
        $('.memmodalbox1').fadeOut();
        $('.memmodal_bg').fadeOut();

    });

    $('.memview2').on('click',()=>{
        $('.memmodalbox2').fadeIn();
        $('.memmodal_bg').fadeIn();
    });

    $('.memmodal_btn2').on('click',()=>{
        $('.memmodalbox2').fadeOut();
        $('.memmodal_bg').fadeOut();

    });

//  체크 박스 
    $('#memcheckerAll').click(function(){
        if($('#memcheckerAll').prop("checked")){
            $('.memchecker').prop("checked", true);
        } else {
            $('.memchecker').prop("checked", false);
        }
    });    

// 우편번호 
    $('.memtdBtn').on('click', function(){
            new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    // if(extraAddr !== ''){
                    //     extraAddr = ' (' + extraAddr + ')';
                    // }
                    // // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("memDetail_Ad").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memAdPost').value = data.zonecode;
                document.getElementById("mem_Ad").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memDetail_Ad").focus();
            }
        }).open();
    })
});