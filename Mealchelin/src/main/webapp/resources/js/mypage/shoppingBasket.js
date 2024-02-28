$(document).ready(()=>{

    $('#mycheckerAll').click(function(){
        if($('#mycheckerAll').prop("checked")){
            $('.mychecker').prop("checked", true);
        } else {
            $('.mychecker').prop("checked", false);
        }
    });

});