$(document).ready(function(){
	$('h1').hide().fadeIn(3000);
    $('.index_table').hide();

    $('input').focus(function(){
    	$(this).css('outline-color', 'white');
    });
    
    $('button').focus(function(){
    	$(this).css('outline-color', 'white');
    });

    $('button').click(function(){
    	$('.index_table').show("fold", 1000);
    });


    $('button').dblclick(function(){
    	$('.index_table').hide("fold", 'center', 1000);
    });



   $('#answer').on("submit", function(event) {
    event.preventDefault();
        $.ajax({
                
 url: "/urls",
                method : "post",
                data: $(this).serialize(), //let ruby understands, 'this is input'
                dataType: 'json',
                success: function(data){
               //setting up table data
                var long_url = "<td>" + "<a href='" + data.long + "'>" + data.long + "</a>" + "</td>"
                var short_url = "<td>" + "https://dogebit.herokuapp.com/" + data.short + "</a>" + "</td>"
                 if (data.counter === undefined || data.counter === null){
                 var count = "<td>" + 0 + "</td>" 
                }
                 else {
                 var count = "<td>" + data.counter + "</td>"
                }
                 //inserting into html page
                 $('#info').html("<p>" + short_url + "</p>" + "<p>" + long_url + "</p>")
                 $('.index_table tr:first').after("<tr>" + long_url + short_url + count + "</tr>");
                 },
                 error: function() {
                    $('#info').html('<p>An error has occurred</p>');
                 },
         });
    });
});





