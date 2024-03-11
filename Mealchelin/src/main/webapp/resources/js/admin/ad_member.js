function adMem_execDaumPostcode(){
    new daum.Postcode({
    oncomplete: function(data) {
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
            document.getElementById("adMemDetailAd").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('adMemAdPost').value = data.zonecode;
        document.getElementById("adMem_Ad").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("adMemDetailAd").focus();
    }
}).open();
}


function adRandomPw_code() {
    let ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
    let ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    let ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    let ranValue4 = ['!','@','#','$','%','^','&','*','(',')'];
    
    var temp_pw = "";
    
    for(i=0 ; i<2; i++) {
        let ranPick1 = Math.floor(Math.random() * ranValue1.length);
        let ranPick2 = Math.floor(Math.random() * ranValue2.length);
        let ranPick3 = Math.floor(Math.random() * ranValue3.length);
        let ranPick4 = Math.floor(Math.random() * ranValue4.length);
        temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
    }
    console.log(temp_pw);
    
    document.getElementById("adRandomPw").value = temp_pw;
}

function formatPhoneNumbers() {
    $('.phoneNumber').each(function () {
        let phoneNumber = $(this).text().replace(/\D/g, '');

        if (phoneNumber.length === 10) {
            phoneNumber = phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        } else if (phoneNumber.length === 11) {
            phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }

        $(this).text(phoneNumber);
    });
}

// 페이지 로드 후에 한 번 호출하여 초기 데이터 변환
$(document).ready(function () {
    formatPhoneNumbers();
});