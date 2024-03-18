$(document).ready(function() {
    // 주문 취소 버튼 클릭 시
    $("#cancelOrderBtn").click(function(e) {
        // 기본 동작(stopPropagation, preventDefault)을 중지하고 취소 여부 메시지를 표시합니다.
        e.preventDefault(); // 기본 동작 중지
        e.stopPropagation(); // 상위 이벤트 전파 방지

        // 취소 여부를 묻는 메시지를 표시합니다.
        var confirmed = confirm("주문을 취소하시겠습니까?");

        // 사용자가 확인을 클릭한 경우에만 취소 요청을 합니다.
        if (confirmed) {
            // 주문 취소 내역 동의 체크박스가 선택되었는지 확인합니다.
            if ($("#pay_fourone").prop("checked")) {
                // 취소 요청을 보냅니다.
                window.location.href = $(this).attr("href");
            } else {
                // 주문 취소 내역 동의 체크박스가 선택되지 않았을 때 경고 메시지를 표시합니다.
                alert("주문 취소 내역에 동의해야 주문을 취소할 수 있습니다.");
            }
        }
    });
});
