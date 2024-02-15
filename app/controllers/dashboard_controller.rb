class DashboardController < ApplicationController
  def index
    @user = current_user
    @user_chats = current_user.chatrooms
  end
end
