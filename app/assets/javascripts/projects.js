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

     // Goals animate
      var goal = $('#goal').attr('data-attribute-goal'); 
      var value = 67
      // $('.fund_raised').attr('data-attribute-amount');
      var today = Date.new
      var meter_color = $('.meter').parent()

      if (parseInt(value) <= 25) {
        meter_color.addClass('alert');
       } else if (parseInt(value) <= 50) {
        meter_color.removeClass('alert');
       } else {
        meter_color.addClass('success');
       }

      jQuery({someValue: 0}).animate({someValue: parseInt(value)}, {
        duration: 1000,
        easing:'swing', // can be anything
        step: function() { // called on every step
          // Update the element's text with rounded-up value:
          $('#el').text(Math.ceil(this.someValue)+ "% of the goal reached");
       }

    });

      var percentage_goal = (parseInt(value)/parseInt(goal))*100 + "%"
      meter = $('.meter');
      width = $('.meter').attr('style');
      meter.attr("style","width: 1%");


        meter.animate({
          duration: 4000,
          width: percentage_goal,
          easing:'swing' // can be anything

        });
   

});