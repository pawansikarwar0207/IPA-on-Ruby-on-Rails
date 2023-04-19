// Inside the click event handler for the user reaction icons
$('.reaction-icon').on('click', function() {
  var reactionType = $(this).data('reaction-type'); // Assuming you have a data attribute to store the reaction type
  var questionId = $(this).data('question-id'); // Assuming you have a data attribute to store the question ID
  var url = '/questions/' + questionId + '/user_reactions'; // Assuming this is the URL for the user reactions endpoint

  // Send an AJAX request to create or update the user reaction
  $.ajax({
    url: url,
    type: 'POST',
    dataType: 'json',
    data: { user_reaction: { reactable_type: reactionType } },
    success: function(response) {
      // Update the view with the new count
      $('.reaction-count').text(response.count); // Assuming this is the element that displays the reaction count
    }
  });

  // Remove the previous user reaction
  $('.reaction-icon.active').removeClass('active'); // Assuming this is the class for the active user reaction
});
