class AddSellerIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :seller_id, :bigint
    change_column_null :chatrooms, :user_id, false
  end
end
