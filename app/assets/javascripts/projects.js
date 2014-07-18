// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:load', function(){

	$(".pledge_form").submit(function(event){
       _this = $(this)
      event.preventDefault();
      $.ajax({
      	url: $(this).attr('action'),
      	type: $(this).attr('method'),
      	dataType: 'json',
      	data: $(this).serialize()
            }).done(function(data){
                  $('.fund_raised').text("$" + data + " Raised");
                  $('.pledge_button').addClass('disabled').attr('disabled','disabled');       
                   _this.find('.pledge_button').attr('value', 'Thank You'+ '\n' + 'for Your Pledge');
            });   

	});

      $('.category_link').click(function(event){
            event.preventDefault()
            $.getScript($(this).attr('href'));
      });	


   

});