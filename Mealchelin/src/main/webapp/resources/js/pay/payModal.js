 document.getElementById('payButton').addEventListener('click', function() {
            var selectedMethod = getSelectedMethod();
            openPaymentPage(selectedMethod);
        });

        function getSelectedMethod() {
            var checkboxes = document.getElementsByName('pay_check');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    return checkboxes[i].value;
                }
            }
            return null;
        }

        // 결제창 열기 함수
        function openPaymentPage(method) {
            switch (method) {
                case 'pay_kakao':
                    // Method 1에 해당하는 결제창 열기
                    IMP.init('channel-key-702e745d-a96e-4bcf-b56c-e3cbbf4c7ede');
                    IMP.request_pay({
                        // Method 1에 해당하는 결제 정보 설정
                    });
                    break;
                case 'pay_card':
                    // Method 2에 해당하는 결제창 열기
                    IMP.init('20ad459ab1ad2f6e541929d50d24765abb05850094a9629041bebb726814625d');
                    IMP.request_pay({
                        // Method 2에 해당하는 결제 정보 설정
                    });
                    break;
                case 'pay_phone':
                    // Method 3에 해당하는 결제창 열기
                    IMP.init('channel-key-7f1f148a-b1b4-42f5-b035-9c1e7e4865c3');
                    IMP.request_pay({
                        // Method 3에 해당하는 결제 정보 설정
                    });
                    break;
                default:
                    alert('결제 방법을 선택해주세요.');
                    break;
            }
        }