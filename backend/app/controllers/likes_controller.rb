class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    logger.debug("current_user #{current_user.methods}")
    like = Like.new(message_id: params[:id], user_id: current_user.id)

    if like.save
      render json: { id: like.id, content: like.message.content, email: current_user.email, message: 'いいねを登録しました' }, status: :ok
    else
      render json: { message: 'いいねが登録できませんでした', errors: like.errors.messages }, status: :bad_request
    end
  end

  def destroy
    like = Like.where(message_id: params[:id], user_id: current_user.id)

    if like.destroy_all
      render json: { id: like.id, email: current_user.email, message: 'いいねを削除しました' }, status: :ok
    else
      render json: { message: 'いいねが削除できませんでした', errors: like.errors.messages }, status: :bad_request
    end
  end
end
