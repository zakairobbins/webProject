// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

    // $('body').on('click', 'a.remove-link', function(e) {
    //   e.preventDefault();
    //   console.log('remove-link clicked');
    //   console.log($(this).closest('.fields').children('div').first().children('div').first().children('.required').val());
    //   $(this).closest('.fields').children('div').first().children('div').first().children('.required').val('');
    //   // $(this).closest('.fields').children('.required').first().val('');
    //   // $(this).closest(".fields").hide();
    //
    // });

    $('body').on('click', 'a.remove-link', function(e) {
      e.preventDefault();

      var typeField = $($(this).closest('.fields').children('div').first().children('div').first().children('input:hidden')[0]).val();
      var idField = $($(this).closest('.fields').children('div').first().children('div').first().children('input:hidden')[1]).val();
      var url = typeField + idField;

      $(this).closest('.fields').remove();
      $.ajax({
        type: 'delete',
        url: url,
        dataType: 'json'
      }).done(function(data){
        console.log(data.message);
      });
    });

    $('a.add_fields').click(function(e) {
      e.preventDefault();
      console.log('add fields clicked');
      var time = new Date().getTime();
      var regex = new RegExp($(this).data('id'), 'g');

      $(this).before($(this).data('fields').replace(regex, time));
    });
})
