class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @user_chats = user_chats(current_user)
  end

  private

  def user_chats(current_user)
    current_user.chatrooms.includes(:messages)
  end
end
