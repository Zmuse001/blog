$(function() {
    // alert('jQuery is working!');

    //form validation for comment body 
    $("#comment-body").on("input", function(){

        console.log('input event fired')
        const value = $(this).value().trim(); 
        const submitButton = $(this).closest('form').find('input[type="submit"]')

        if(value === ''){
            $(this).css('border-color', 'red');
            submitButton.prop('disabled', true);
        } else{
            $(this).css('border-color', '');
            submitButton.prop('disabled', false);
        }
    });
    //dynamic content loading for comments 
    $('#load-comments').on('click', function(){
        const url = '/categories/5/articles/14/comments';
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
        })
    });
}); 