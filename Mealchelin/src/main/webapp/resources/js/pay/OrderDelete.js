$(document).ready(() => {
  $('input[type="checkbox"][name="pay_check"]').click(function () {
    if ($(this).prop("checked")) {
      $('input[type="checkbox"][name="pay_check"]').prop("checked", false);

      $(this).prop("checked", true);
    }
  });
});
