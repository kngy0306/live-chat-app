class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data_from_front)
    user = User.find_by(email: data_from_front['email'])

    if message = Message.create(content: data_from_front['message'], user_id: user.id)
      ActionCable.server.broadcast 'room_channel', { message: data_from_front['message'], name: user.name, created_at: message.created_at }
    end
  end
end
