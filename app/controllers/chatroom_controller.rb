class ChatroomController < ApplicationController
  def index
    @users = User.all
    user = current_user
    @chatroom = user.chatrooms.all
  end

  def new
    @chatroom = Chatroom.find_by(id: params[:format])
    @chatroom_users = @chatroom.users.all
  end

  def update
    user = User.find_by_id(params[:id])
    chatroom = Chatroom.find(params[:format])
    chatroom.users.delete(user)
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatroom_index_path
  end

  def create
    if params[:group_members].present?
      params[:group_members].push(current_user.id)
      @chatroom = Chatroom.create(description: params[:group_title].empty? ? "No Name" : params[:group_title])
      params[:group_members].each do |ids|
        @chatroom.chatroom_users.create(user_id: ids)
        flash[:alert] = "Successfully Created"
      end
    else
      flash[:alert] = "Please add at lease one member"
    end
    redirect_to chatroom_index_path
  end
end
