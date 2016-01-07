// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    console.log("request js ready");

    $('body').on('click', 'a.remove-link', function(e) {
      e.preventDefault();
      console.log('remove-link clicked');
      $(this).closest('.fields').children('.required').first().val('');
      // $(this).prev("input[type=hidden]").val("1");
      $(this).closest(".fields").hide();

    });

    $('a.add_fields').click(function(e) {
      e.preventDefault();
      console.log('add fields clicked');
      var time = new Date().getTime();
      var regex = new RegExp($(this).data('id'), 'g');

      $(this).before($(this).data('fields').replace(regex, time));
    });
})
