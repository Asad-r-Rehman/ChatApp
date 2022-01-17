class MessageController < ApplicationController
  def index

  end

  def create
    user = current_user.id
    chatroom = params[:chatroom]
    message = Message.create(body: params[:message][:body], user_id: user, chatroom_id: chatroom)
    ActionCable.server.broadcast "chatroom_channel" , mod_message: render_message(message)
    # message.user_id = user
    # message.chatroom_id = chatroom
    # message.save
  end

  def destroy
    message = Message.find_by_id(params[:id])
    ActionCable.server.broadcast "chatroom_channel" , delete_message: message
    message.destroy

  end

  private

  def render_message(message)
    render( partial: 'layouts/message', locals: {message: message})

  end

  def delete_message(message)
    render( partial: 'layouts/message', locals: {message: message})

  end

  def message_params
    params.permit(:body)
  end
end
