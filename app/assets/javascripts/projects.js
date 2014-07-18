// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:load', function(){

  if ($("#already_backed").length > 0){
      $('.pledge_button').attr('value','Thank You'+ '\n' + 'for Your Pledge').addClass('disabled').attr('disabled','disabled');
  }

	$(".pledge_form").submit(function(event){
       _this = $(this)
      event.preventDefault();
      $.ajax({
      	url: $(this).attr('action'),
      	type: $(this).attr('method'),
      	dataType: 'json',
      	data: $(this).serialize()
            }).done(function(data){
                  console.log(data)
                  $('.fund_raised').text("$" + data.total_pledged + " Raised");

                  $('.pledge_button').addClass('disabled').attr('disabled','disabled');       
                   _this.find('.pledge_button').attr('value', 'Thank You'+ '\n' + 'for Your Pledge');

                  $('#user_pledge_state').html("<p>I have backed this project with $"+ data.pledge_amount +"</p>")
            });   

	});

  $('.category_link').click(function(event){
        event.preventDefault()
        $.getScript($(this).attr('href'));
  });	


   

});