var acc = document.getElementsByClassName("accordion");
var i;

$(document).ready(function(){
  for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
      this.classList.toggle("active");
      this.nextElementSibling.classList.toggle("show");
    }
  }
});
