$(function() {
  $(".generate-ipsum-button").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function(res) {
        $(".ipsum-well").append("<span>"+res["text"]+" <span>");

      },
      error: function(jqXHR, textStatus, errorThrown) {
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
