ClassicEditor
    .create( document.querySelector( '#adCSWriteContent' ),{
    	ckfinder: {
			uploadUrl: '/admin/post/image.do'
			}
		})
    .catch( error => {
        console.error( error );
} );

function QnASelect2(e){
    const value = e.value;
    let adQnAcat2 = document.getElementById('adQnAcat2');

    if(value=="자주묻는질문"){
        adQnAcat2.style.display="inline-table";
    } else {
        adQnAcat2.style.display="none";
    }
    
}
