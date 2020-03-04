App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    return console.log("success to connect!")
  },
  disconnected: function() {
  },
  received: function(data) {
    return $('#messages').append(data['message']);
  },
  speak: function(message) {
    // var messages = document.getElementById('messages');
    // console.log(messages.dataset.room_id);
    // console.log($('#messages').data('room_id'))
    return this.perform('speak', {message: message, room_id: messages.dataset.room_id});
  }
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event){
  if ( event.keyCode === 13 ) {
    App.room.speak(event.target.value);
    event.target.value = ''
    event.preventDefault();


    var all = $('#all-messages').outerHeight(true);
    console.log(all);

    var c = $('#messages').scrollTop();
    console.log(c);

    var target = $('.message').last();
    var position = target.offset().top
    var message = $('.message').height();
    var addmessage = position + message;
    console.log(addmessage);

    var scrollbox = $('#messages').height();
    console.log(scrollbox);

    // $('#messages').scrollTop(y-b);

  }
});
$(document).ready( function(){
  var allmessages = $('#all-messages').outerHeight(true);
  var scrollbox = $('#messages').height();
  $('#messages').scrollTop(allmessages - scrollbox);
  console.log(allmessages - scrollbox);
});
