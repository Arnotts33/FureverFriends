class AddUserIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
  end
end
