# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  email = $("#email").val()
  password = $("#password").val()
  $("#user_email").focus ->
    @placeholder = ""

  $("#user_email").blur ->
    @placeholder = email

  $("#user_password").focus ->
    @placeholder = ""

  $("#user_password").blur ->
    @placeholder = password