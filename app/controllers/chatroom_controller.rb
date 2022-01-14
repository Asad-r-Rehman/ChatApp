class ChatroomController < ApplicationController
  after_action :admin_right, only: ['create']

  def index
    @users = User.all
    user = current_user
    @chatroom = user.chatrooms.all
  end

  def new
    @msg = Message.new
    @chatroom = Chatroom.find_by(id: params[:format])
    @message = @chatroom.messages.all
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
      group_name = params[:group_title].empty? ? "No Name" : params[:group_title]
      @chatroom = Chatroom.new
      @chatroom.description = group_name
      @chatroom.save!
      params[:group_members].each do |ids|
        @chatroom.chatroom_users.create(user_id: ids)
        flash[:alert] = "Successfully Created"
      end
    else
      flash[:alert] = "Please add at lease one member"
    end
  end

  private

  def admin_right
    user_right = ChatroomUser.find_by(user_id: current_user.id, chatroom_id: @chatroom.id)
    user_right.admin_role = true
    if user_right.save!
      redirect_to chatroom_index_path
    end
  end
end
