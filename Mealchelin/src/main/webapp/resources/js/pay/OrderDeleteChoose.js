$(document).ready(function() {
    // 체크박스가 클릭될 때
    $('input[type="checkbox"][name="pay_check"]').click(function() {
        // 현재 클릭한 체크박스의 상태를 확인합니다.
        var isChecked = $(this).prop('checked');

        // 다른 모든 체크박스의 체크 상태를 해제합니다.
        $('input[type="checkbox"][name="pay_check"]').not(this).prop('checked', false);

        // 클릭한 체크박스만 선택합니다.
        $(this).prop('checked', isChecked);
    });
});