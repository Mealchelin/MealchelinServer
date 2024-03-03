$(document).ready(()=>{

	Kakao.init('7ad5e5ad4339605ae8d738611bbcb1c7');

	$('.memSns2').on('click', function () {
    Kakao.Auth.login({
      scope: 'profile_nickname, account_email',
      success: function (authObj) {
        console.log(authObj);

        Kakao.API.request({
          url: '/v2/user/me',
          success: function (res) {
            const kakao_account = res.kakao_account;
            console.log(kakao_account);
          },
          fail: function (error) {
            console.error('사용자 정보를 가져오는데 실패했습니다:', error);
          },
        });
      },
      fail: function (error) {
        console.error('카카오 로그인에 실패했습니다:', error);
      },
    });
  });



});

