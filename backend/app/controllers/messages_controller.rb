class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    messages = Message.eager_load(:user)
    logger.debug("Message.allで取得した結果 #{messages}")
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        created_at: message.created_at,
        likes: message.likes&.map { |like| { id: like.id, email: like.user.email } }
      }
    end
    logger.debug("Message.all→mapで整形した結果 #{messages_array}")
    render json: messages_array, status: :ok
  end
end
