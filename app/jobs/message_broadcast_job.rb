# method perform will receive message and render it to _message.html.erb partial
# then return the html code to client

class MessageBroadcastJob < ApplicationJob
  queue_as :default # specifies the name of the queue to process the job on

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)    
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(
        partial: 'messages/message', 
        locals: { message: message }
      )
    end
end
