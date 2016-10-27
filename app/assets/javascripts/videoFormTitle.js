$(document).ready(function() {
  if(window.location.href.includes('video') && window.location.href.includes('edit')) {
    $("#video-form").text("Edit Video")
  } else {
    $("#video-form").text("Add Video")
  }
})
