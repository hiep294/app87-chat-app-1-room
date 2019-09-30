App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # will recieve html code which include message
    $('#messages').append data['message'] # then append it to #messages

  speak: (message) ->
    @perform 'speak', message: message
    # perform is an action of App.room, will call RoomChannel > speak

$(document).on 'keypress', '[data-behavior=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()