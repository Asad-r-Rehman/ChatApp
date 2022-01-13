class MessageController < ApplicationController
  def index

  end

  def create
    user = current_user.id
    chatroom = params[:chatroom]
    @message = Message.create(body: params[:message][:body], user_id: user, chatroom_id: chatroom)
    # message.user_id = user
    # message.chatroom_id = chatroom
    # message.save
  end

  def destroy
    message = Message.find_by_id(params[:id])
    message.destroy

  end

  private

  def message_params
    params.permit(:body)
  end
end
