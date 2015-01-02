$(function() {
  $(".generate-ipsum-button").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function() {
      },
      error: function() {
        alert("ERROR!!");
      }
    });
  });
  
  $(".remove-ipsum-button").click(function(event) {
    event.preventDefault();
    var theIpsum = $(".ipsum-well")
    var lastSpan = theIpsum.children().last()
    lastSpan.remove()
  });

});
