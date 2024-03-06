ClassicEditor
    .create( document.querySelector( '#adCSWriteContent' ))
    .catch( error => {
        console.error( error );
} );

function QnASelect(e){
    const value = e.value;
    let adQnAcat = document.getElementById('adQnAcat');

    if(value=="자주묻는질문"){
        adQnAcat.style.display="inline-table";
    } else {
        adQnAcat.style.display="none";
    }
    
}