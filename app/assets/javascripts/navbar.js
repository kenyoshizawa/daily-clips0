$(document).ready(function(){
  $('.user-menu .submenu').on('click', function(){
    $(this).next().toggleClass('hidden');
  });
});
