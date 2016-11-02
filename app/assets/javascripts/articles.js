$( document ).ready(function() {
  $("#task-form").submit(function(event){
    event.preventDefault();

    var action = $(this).attr('action');
    var method = $(this).attr('method');

   var title = $(this).find('#article_title').val();
  
  
    var text = $(this).find('#article_text').val();
     

    $.ajax({
      method: method,
      url: action,
      data: { title: title, text: text },
      dataType: 'script'
    });


  });
});


// $( document ).on('turbolinks:load', function() {
//   console.log("It works on each visit!")
// })


