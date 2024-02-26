ClassicEditor
    .create( document.querySelector( '#adCSWriteContent' ))
    .catch( error => {
        console.error( error );
} );


function QnASelect2(e){
    const value = e.value;
    let adQnAcat = document.getElementById('adQnAcat2');

    if(value=="qna"){
        adQnAcat.style.display="inline-table";
    } else {
        adQnAcat.style.display="none";
    }

}