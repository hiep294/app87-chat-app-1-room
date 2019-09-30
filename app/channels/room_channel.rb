class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # get message from route: room.coffee
  def speak(data)
    Message.create! content: data['message']
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    # => moved to MessageBroadcastJob
    # in data['message'], data is the paramenter, message is created by client
  end
end
