$(function() {
  App.room = App.cable.subscriptions.create({channel: "RoomChannel", user: $('#messages').data('current_user_id') ,room: $('#messages').data('room_id')}, {
    connected: function() {
      return console.log("success to connect!")
    },
    disconnected: function() {
      return console.log("disconnected")
    },
    received: function(data) {
      return $('#messages').append(data['message']);
    },
    speak: function(message) {
      return this.perform('speak', {message: message});
    }
  });


  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event){
    if ( event.keyCode === 13 ) {
      App.room.speak(event.target.value);
      event.target.value = ''
      event.preventDefault();
    }
  });
});
