$(document).ready(function(){

  $("#paypal-button").on("click", function(){
    $.ajax({
      type: "put",
      url: "/orders/" + $("#order-id-form").val(),
      dataType: "json"
    });
  });

});
