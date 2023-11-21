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
        const categoryid = $('#category-id').data('category');
        const articleid = $('#load-comments').data('article');
        console.log(categoryid);
        console.log(article.id);
        const url = `/categories/${categoryid}/articles/${articleid}/comments`;
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
            //Append the new comments to the container #comments
            ("p").append("#comments")
        })
        // add .fail callback to handle error messaging
        $.getJSON(url)
            .done(function(data) {
                // Success callback
                console.log('Success:', data);
            })
            .fail(function(xhr, textStatus, errorThrown) {
                // Error callback
                console.error('Error:', textStatus, errorThrown);
            });
    });
}); 