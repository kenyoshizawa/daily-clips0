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
    console.log(message)
    // var messages = document.getElementById('messages');
    // console.log(messages.dataset.room_id);
    console.log($('#messages').data('room_id'))
    return this.perform('speak', {message: message, room_id: messages.dataset.room_id});
  }
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event){
  if ( event.keyCode === 13 ) {
    App.room.speak(event.target.value);
    event.target.value = ''
    event.preventDefault();

    // 自動スクロール
    var a = $('#test').outerHeight(true);
    console.log(a);

    var c = $('div').scrollTop();
    console.log(c);

    var target = $('.message').last();
    var position = target.offset().top
    var y = c + position;
    console.log(y);

    var b = $('#messages').height();
    console.log(b);

    // $('#messages').scrollTop(y-b);
  }
});
$(document).ready( function(){
  var a = $('#test').outerHeight(true);
  $('#messages').scrollTop(a);
});
