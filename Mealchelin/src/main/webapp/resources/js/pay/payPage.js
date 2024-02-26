$(document).ready(()=>{

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

        $('input[type="checkbox"][name="pay_check"]').click(function(){
 
            if($(this).prop('checked')){
           
               $('input[type="checkbox"][name="pay_check"]').prop('checked',false);
           
               $(this).prop('checked',true);
           
              }
            
             });













    });