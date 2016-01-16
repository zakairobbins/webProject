// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
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

    $('#file-upload-div-toggle').click(function(e){
      e.preventDefault();
      console.log('link clicked');
      $('#file-upload-div').slideToggle(300);
    });

    //upload files
    var $form = $("#file-form");
    var $fileSelect = $("#file-select");
    var $uploadButton = $("#upload-button");

    $form.on('submit', function(event){
      event.preventDefault();
      // debugger;
      $uploadButton.html('uploading');
      var $file = $fileSelect[0].files[0];
      var formData = new FormData();
      formData.append('file', $file);
      var upload = $.ajax({
        type: "put",
        url: "/requests/" + $("request-id-form").val(),
        dataType: "json",
        contentType: false,
        processData: false,
        data: formData
      });
      upload.done(function(msg) {
        console.log('success: ' + msg )
        $uploadButton.html('File Attached');
      });
      upload.fail(function(json, textStatus) {
        console.log('upload failed:' + textStatus)
      });
    });
});
