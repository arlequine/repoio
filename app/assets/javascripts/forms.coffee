$(document).on "ajax:beforeSend", "#emails-form", ()->
  $("#email-info").html "Se procesa tu petición"
$(document).on "ajax:success", "#emails-form", (e,data,estado,xhr)->
  $(this).slideUp()
  $("#email-info").html "Ya tienes una invitación beta"
$(document).on "ajax:error", "#emails-form", (e,data,estado,xhr)->
  $("#email-info").html data.responseJSON.email[0]